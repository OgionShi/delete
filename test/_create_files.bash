#!/bin/bash

# TYPE:         function
# DESCRIPTION:  this function creates several directories, files and links for
#               testing other functions. These files creates in the directory
#               specified in file_src.bash
# BAGS:         command tree requires root permission
# ADD:          -

source ./file_src.bash

_create_files (){
    # CREATE DIRECTORIES
    # Create a common directory for files
    mkdir -p "${directory}"

    ## Create an empty directory
    mkdir -p "${FILES_PATHS["directory_empty"]}"

    ## Create a directory with some content
    mkdir -p "${FILES_PATHS["directory_content"]}"/dir{1..2} && \
    touch "${FILES_PATHS["directory_content"]}/dir1/content_file"

    ## Create a dark directory
    mkdir -p "${FILES_PATHS["directory_restricted"]}" && \
    chmod 000 "${FILES_PATHS["directory_restricted"]}"

    ## Create a hidden directory
    mkdir -p "${FILES_PATHS["directory_hidden"]}"

    # CREATE REGULAR FILES
    ## Create an empty regular file
    touch "${FILES_PATHS["regularFile_empty"]}"

    ## Create a file with the content
    echo "Content" > "${FILES_PATHS["regularFile_content"]}"

    ## Create an exectutable file
    echo -e "#!/bin/bash\necho 'Hello, world!'" >  "${FILES_PATHS["regularFile_exec"]}" && \
    chmod 755 "${FILES_PATHS["regularFile_exec"]}"

    ## Create a hidden directory
    touch "${FILES_PATHS["regularFile_hidden"]}"

    ## Create a file is reffered to
    echo "Content of simple file" > "${FILES_PATHS["simpleFile_reffered"]}"

    # CREATE LINKS
    ## Create a first hardlink
    ln "${FILES_PATHS["simpleFile_reffered"]}" "${FILES_PATHS["hardlink_first"]}" 2> /dev/null 

    ## Create a second hardlink
    ln "${FILES_PATHS["simpleFile_reffered"]}" "${FILES_PATHS["hardlink_second"]}" 2> /dev/null

    ## Create a symbol link file to simple file
    ln -s "${FILES_PATHS["simpleFile_reffered"]}" "${FILES_PATHS["symlink_simpleFile"]}" 2> /dev/null

    ## Create a symbol link file to previos symbol link file
    ln -s "${FILES_PATHS["symlink_simpleFile"]}" "${FILES_PATHS["symlink_symlink"]}" 2> /dev/null
    
    # Show files configuration
    echo "Environment for tests is created"
    sudo tree -a "${directory}" 
}
#_create_files
