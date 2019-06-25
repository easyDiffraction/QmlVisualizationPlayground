cmake_minimum_required(VERSION 2.8.11)

project(vtkqml)
set(VTK_DIR "/home/nithin/software/vtk/build-6.3.0/")
find_package(VTK REQUIRED)
include(${VTK_USE_FILE})
#add_executable(vtkglut vtkglut.cpp)
#target_link_libraries(vtkglut ${VTK_LIBRARIES} -lglut)


find_package(Qt5 COMPONENTS Quick Core Network OpenGL)
qt5_add_resources(RESOURCES vtkqml.qrc)
qt5_wrap_cpp(MOC_SRCS  vtkqml.h )
add_executable(vtkqml vtkqml.cpp vtkqml.h main.cpp ${RESOURCES} ${MOC_SRCS})
qt5_use_modules(vtkqml Quick Core Network OpenGL)
target_link_libraries(vtkqml ${VTK_LIBRARIES})
