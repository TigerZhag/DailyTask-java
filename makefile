# create *.h and *.c for java class which use native method
# usage:
#   0. edit the var to adapt your own project
#   1. create .java file in pnative which need contains native method
#
# author: zhang shi xin
# email : tiger.zhag@gmail.com
# date :  2017.2.23

#normal setting
src := ./src/
jniSrc := ./src/jni/
javaSrc := ./src/com/tiger/daily/pnative/
jniLibs := ./src/jniLibs/

#system setting
javaLibPath := ~/.local/share/umake/ide/idea/bin/
packageName := com.tiger.daily.pnative.

vpath %.java $(javaSrc)
vpath %.c $(jniSrc)
vpath %.h $(jniSrc)
vpath %.so $(jniLibs)

.PHONY: all clean veryClean
ifndef DEBUG
.SILENT:
endif

files := $(wildcard *.java $(javaSrc)*.java)

all: #$(jniLibs)$(obj).so
	@echo $(files)
	@echo $(fileNames)
	@echo $(obj)
	@echo $(sourceTemp)
	@echo $(sources)

sourcesh = $(patsubst %.java,%.h,$(notdir $(files)))
sourcesc = $(patsubst %.h,%.c,$(sourcesh))
libs = $(patsubst %.h,lib%.so,$(sourcesh))

lib:$(libs)

$(libs):lib%.so:%.c %.h
	-@gcc -fPIC -I"$(JAVA_HOME)/include" -I"$(JAVA_HOME)/include/linux/"  -shared -o $(jniLibs)$@ $(foreach var,$^,$(jniSrc)$(var))
	@ln -f $(jniLibs)$@ $(javaLibPath)$(mFileName)

source: $(sourcesc)

$(sourcesc):%.c:%.h
	@echo "create .c"
	@echo "#include \"$<\"" > $(jniSrc)$@

$(sourcesh):%.h:%.java
	@echo "create .h"
	@javah -o $(jniSrc)$@ -cp $(src) $(packageName)$(basename $(notdir $<))



# $(jniLibs)$(obj).so: $(jniSrc)$(obj).c $(jniSrc)$(obj).h
#	gcc -fPIC -I"$(JAVA_HOME)/include" -I"$(JAVA_HOME)/include/linux/" -shared -o $@ $^
#	mFileName = $(patsubst $(jniLibs)%,%,$@)
#	ln -f $@ $(javaLibPath)lib$(mFileName)

# $(jniSrc)$(obj).c: $(jniSrc)$(obj).h
# #create the .c file
#	touch $@
#	echo "now you should complete the " $@ "file and make all again"

# $(jniSrc)$(obj).h: $(files)
#	@echo $^
#	@echo $@
#	mFileName = $(patsubst $(jniSrc)%.h,$(packageName).%,$@)
#	javah -o $@ -cp $(src) mFileName

clean:
	rm $(jniSrc)*
	rm $(jniLibs)*

veryClean: clean
