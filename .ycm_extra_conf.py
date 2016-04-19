import os
import ycm_core
import os.path

flags = [
        '-Wall',
        '-Wextra',
        '-Werror',
        '-Wc++98-compat',
        '-Wno-long-long',
        '-Wno-variadic-macros',
        '-fexceptions',
        '-DNDEBUG',
        '-I.',
        '-I./ClangCompleter',
        '-I/usr/lib',
        '-I/usr/include'
        ]

compilation_database_folder = ''

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]
HEADER_EXTENSIONS = [ '.h', '.hxx', '.hpp', '.hh' ] 

if os.path.exists( compilation_database_folder ):
    database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
    database = None


def DirectoryOfThisScript():
    return os.path.dirname( os.path.abspath( __file__ ) )


def IsHeaderFile( filename ):
    extension = os.path.splitext( filename )[ 1 ]
    return extension in HEADER_EXTENSIONS


def FlagsForClangComplete( root ):
    try:
        clang_complete_path = FindNearest(root, '.clang_complete')
        clang_complete_flags = open(clang_complete_path, 'r').read().splitlines()
        return clang_complete_flags
    except:
        return None


def FlagsForInclude(root):
    try:
        include_path = FindNearest(root, 'include')
        flags = []
        for dirroot, dirnames, filenames in os.walk(include_path):
            for dir_path in dirnames:
                real_path = os.path.join(dirroot, dir_path)
                flags = flags + ["-I" + real_path]
        return flags
    except:
        return None


def GetCustomizedFlags( root, kwargs ):
    extra_flags = []
    data = kwargs[ 'client_data' ]
    filetype = data[ '&filetype' ]

    if filetype == 'c':
        language = 'c'
    elif filetype == 'h':
        language = 'c'
    elif filetype == 'cpp':
        language = 'c++'
        extra_flags += ['-std=c++11']
    elif filetype == 'objc':
        language = 'objective-c'

    final_flags = flags
    clang_flags = FlagsForClangComplete( root )
    if clang_flags:
        final_flags = final_flags + clang_flags
    include_flags = FlagsForInclude( root )
    if include_flags:
        final_flags = final_flags + include_flags

    return final_flags + extra_flags + [ '-x', language ]


def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
    if not working_directory:
        return list( flags )
    new_flags = []
    make_next_absolute = False
    path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
    for flag in flags:
        new_flag = flag

    if make_next_absolute:
        make_next_absolute = False
    if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
        if flag == path_flag:
            make_next_absolute = True
            break

        if flag.startswith( path_flag ):
            path = flag[ len( path_flag ): ]
            new_flag = path_flag + os.path.join( working_directory, path )
            break

    if new_flag:
        new_flags.append( new_flag )
    return new_flags


def GetCompilationInfoForFile( filename ):
    if IsHeaderFile( filename ):
        basename = os.path.splitext( filename )[ 0 ]
        for extension in SOURCE_EXTENSIONS:
            replacement_file = basename + extension
        if os.path.exists( replacement_file ):
            compilation_info = database.GetCompilationInfoForFile(replacement_file )
        if compilation_info.compiler_flags_:
            return compilation_info
        return None
    return database.GetCompilationInfoForFile( filename )


def FlagsForFile( filename, **kwargs ):
    root = os.path.realpath( filename );
    if database:
        compilation_info = GetCompilationInfoForFile( filename )
        if not compilation_info:
            return None

        final_flags = MakeRelativePathsInFlagsAbsolute(
                compilation_info.compiler_flags_,
                compilation_info.compiler_working_dir_ )

        final_flags = final_flags + GetCustomizedFlags( root, kwargs )
        try:
            final_flags.remove( '-stdlib=libc++' )
        except ValueError:
            pass
    else:
        relative_to = DirectoryOfThisScript()
        final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )
        final_flags = final_flags + GetCustomizedFlags( root, kwargs )

    return {
            'flags': final_flags,
            'do_cache': True
            }
