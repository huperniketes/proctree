CXX=g++
CPPFLAGS=-std=c++11 -O3 -fpermissive
PROCTREE_LDFLAGS=
HAPPYTREE_LDFLAGS=-lGL -lSDL
HAPPYTREE_INCLUDES=-I /usr/include/SDL -I /usr/include/gl
PROCTREE_DIR=proctree
HAPPYTREE_DIR=happytree
RM=rm -f


all: proctree happytree
	@echo "complete"

proctree: $(PROCTREE_DIR)/main.o $(PROCTREE_DIR)/proctree.o
	$(CXX) $(CPPFLAGS) $(PROCTREE_DIR)/main.o $(PROCTREE_DIR)/proctree.o -o $(PROCTREE_DIR)/proctree $(PROCTREE_LDFLAGS)
	@echo "proctree built"

$(PROCTREE_DIR)/main.o: $(PROCTREE_DIR)/main.cpp
	$(CXX) $(CPPFLAGS) -c $(PROCTREE_DIR)/main.cpp -o $(PROCTREE_DIR)/main.o

$(PROCTREE_DIR)/proctree.o: $(PROCTREE_DIR)/proctree.cpp $(PROCTREE_DIR)/proctree.h
	$(CXX) $(CPPFLAGS) -c $(PROCTREE_DIR)/proctree.cpp -o $(PROCTREE_DIR)/proctree.o

happytree: $(HAPPYTREE_DIR)/diskio.o $(HAPPYTREE_DIR)/GLee.o $(HAPPYTREE_DIR)/glstuff.o $(HAPPYTREE_DIR)/imgui.o $(HAPPYTREE_DIR)/imgui_impl.o $(HAPPYTREE_DIR)/main.o $(HAPPYTREE_DIR)/presets.o $(HAPPYTREE_DIR)/shader.o $(HAPPYTREE_DIR)/stb_image.o $(HAPPYTREE_DIR)/toolkit.o $(PROCTREE_DIR)/proctree.o
	$(CXX) $(CPPFLAGS) $(HAPPYTREE_DIR)/diskio.o $(HAPPYTREE_DIR)/GLee.o $(HAPPYTREE_DIR)/glstuff.o $(HAPPYTREE_DIR)/imgui.o $(HAPPYTREE_DIR)/imgui_impl.o $(HAPPYTREE_DIR)/main.o $(HAPPYTREE_DIR)/presets.o $(HAPPYTREE_DIR)/shader.o $(HAPPYTREE_DIR)/stb_image.o $(HAPPYTREE_DIR)/toolkit.o $(PROCTREE_DIR)/proctree.o -o $(HAPPYTREE_DIR)/happytree $(HAPPYTREE_LDFLAGS)
	@echo "happytree built"

$(HAPPYTREE_DIR)/diskio.o: $(HAPPYTREE_DIR)/diskio.cpp
	$(CXX) $(CPPFLAGS) $(HAPPYTREE_INCLUDES) -c $(HAPPYTREE_DIR)/diskio.cpp -o $(HAPPYTREE_DIR)/diskio.o

$(HAPPYTREE_DIR)/GLee.o: $(HAPPYTREE_DIR)/GLee.c $(HAPPYTREE_DIR)/GLee.h
	$(CXX) $(CPPFLAGS) $(HAPPYTREE_INCLUDES) -c $(HAPPYTREE_DIR)/GLee.c -o $(HAPPYTREE_DIR)/GLee.o

$(HAPPYTREE_DIR)/glstuff.o: $(HAPPYTREE_DIR)/glstuff.cpp
	$(CXX) $(CPPFLAGS) $(HAPPYTREE_INCLUDES) -c $(HAPPYTREE_DIR)/glstuff.cpp -o $(HAPPYTREE_DIR)/glstuff.o

$(HAPPYTREE_DIR)/imgui.o: $(HAPPYTREE_DIR)/imgui.cpp $(HAPPYTREE_DIR)/imgui.h $(HAPPYTREE_DIR)/stb_rect_pack.h $(HAPPYTREE_DIR)/stb_truetype.h
	$(CXX) $(CPPFLAGS) $(HAPPYTREE_INCLUDES) -c $(HAPPYTREE_DIR)/imgui.cpp -o $(HAPPYTREE_DIR)/imgui.o

$(HAPPYTREE_DIR)/imgui_impl.o: $(HAPPYTREE_DIR)/imgui_impl.cpp
	$(CXX) $(CPPFLAGS) $(HAPPYTREE_INCLUDES) -c $(HAPPYTREE_DIR)/imgui_impl.cpp -o $(HAPPYTREE_DIR)/imgui_impl.o

$(HAPPYTREE_DIR)/main.o: $(HAPPYTREE_DIR)/main.cpp $(HAPPYTREE_DIR)/happytree.h
	$(CXX) $(CPPFLAGS) $(HAPPYTREE_INCLUDES) -c $(HAPPYTREE_DIR)/main.cpp -o $(HAPPYTREE_DIR)/main.o

$(HAPPYTREE_DIR)/presets.o: $(HAPPYTREE_DIR)/presets.cpp
	$(CXX) $(CPPFLAGS) $(HAPPYTREE_INCLUDES) -c $(HAPPYTREE_DIR)/presets.cpp -o $(HAPPYTREE_DIR)/presets.o

$(HAPPYTREE_DIR)/shader.o: $(HAPPYTREE_DIR)/shader.cpp $(HAPPYTREE_DIR)/shader.h
	$(CXX) $(CPPFLAGS) $(HAPPYTREE_INCLUDES) -c $(HAPPYTREE_DIR)/shader.cpp -o $(HAPPYTREE_DIR)/shader.o

$(HAPPYTREE_DIR)/stb_image.o: $(HAPPYTREE_DIR)/stb_image.c $(HAPPYTREE_DIR)/stb_image.h
	$(CXX) $(CPPFLAGS) $(HAPPYTREE_INCLUDES) -c $(HAPPYTREE_DIR)/stb_image.c -o $(HAPPYTREE_DIR)/stb_image.o

$(HAPPYTREE_DIR)/toolkit.o: $(HAPPYTREE_DIR)/toolkit.cpp $(HAPPYTREE_DIR)/stb_image.h $(HAPPYTREE_DIR)/GLee.h
	$(CXX) $(CPPFLAGS) $(HAPPYTREE_INCLUDES) -c $(HAPPYTREE_DIR)/toolkit.cpp -o $(HAPPYTREE_DIR)/toolkit.o

clean:
	$(RM) $(PROCTREE_DIR)/*.o $(PROCTREE_DIR)/proctree $(HAPPYTREE_DIR)/*.o $(HAPPYTREE_DIR)/happytree
	@echo "done"
