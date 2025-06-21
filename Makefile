include ./conf/structure_of_project.mk

.PHONY: make_file_executable

make_file_executable :
	chmod +x $(wildcard $(SRC_DIR)/*.bash)
