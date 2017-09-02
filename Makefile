CXX := clang
CXXFLAGS := -Wall -std=c++11 -g
LD := clang
LDFLAGS := -lstdc++ -lglfw -lGLEW -lGL -g

MK_DEPENDS := Makefile.1
MK_SOURCES := Makefile.2
SH_MKDEPENDS := makedepends.sh

-include $(MK_SOURCES)

TARGET := block
#$(SRCS)の.cppを.oに変換して格納
OUTS := $(SRCS:%.cpp=%.o)
SRCDIR := src


#デフォルト生成規則
#makedependを実行し、test_implを生成する
$(TARGET) : $(OUTS) mkdep
	$(MAKE) target_impl

#実際のバイナリ生成
target_impl : $(OUTS)
	$(LD) $(OUTS) -o $(TARGET) $(LDFLAGS)

#依存関係
-include $(MK_DEPENDS)

#サフィックスルール
.cpp.o: 
	$(CXX) -c $< -o $@ $(CXXFLAGS)

#コマンド一覧
.PHONY : clean mkdep

clean :
	find $(SRCDIR) -name "*.o" | while read -r f; do rm -f $$f; done
	rm -f $(MK_DEPENDS) $(MK_SOURCES) $(TARGET)

mkdep :
	bash $(SH_MKDEPENDS)

run : $(TARGET)
	./$(TARGET)
