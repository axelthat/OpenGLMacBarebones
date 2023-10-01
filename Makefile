CC := clang
CC_FLAGS := -Wall -DGL_SILENCE_DEPRECATION -std=c17 -IDependencies/GLAD/include

CXX := clang++
CXX_FLAGS := -Wall -DGL_SILENCE_DEPRECATION -std=c++20 -IDependencies/GLFW/include -IDependencies/GLAD/include -IDependencies/GLM
CXX_LDFLAGS := -LDependencies/GLFW/lib-arm64 -lglfw3 -framework OpenGL -framework IOKit -framework CoreVideo -framework Cocoa -framework Carbon

CC_SOURCE := $(wildcard src/*.c)
CXX_SOURCE := $(wildcard src/*.cpp)

OBJS := $(CC_SOURCE:.c=.o) $(CXX_SOURCE:.cpp=.o)

TARGET := main

$(TARGET): $(OBJS)
	$(CXX) $(CXX_FLAGS) $(CXX_LDFLAGS) $^ -o $@
	./$(TARGET)

%.o: %.cpp
	$(CXX) $(CXX_FLAGS) -c $< -o $@

%.o: %.c
	$(CC) $(CC_FLAGS) -c $< -o $@

clean:
	rm -rf $(OBJS) $(TARGET)