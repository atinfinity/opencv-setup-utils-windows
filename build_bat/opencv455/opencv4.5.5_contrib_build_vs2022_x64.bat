:: setting of the environment variables
set SOURCE_DIR=%~dp0
set BUILD_DIR=%SOURCE_DIR%\build
set INSTALL_DIR=%BUILD_DIR%\install
set VC_VERSION=2022
set VC_VERSION_NUM=17
set VS_EDITION=Community
set VCVARSALL_BAT="C:\Program Files\Microsoft Visual Studio\%VC_VERSION%\%VS_EDITION%\VC\Auxiliary\Build\vcvars64.bat"

set ARCH=x64
set GENERATOR_NAME=Visual Studio %VC_VERSION_NUM% %VC_VERSION%
set OPENCV_CONTRIB_MODULE_PATH=C:\dev\opencv_contrib-4.5.5\modules
set TBB_ROOT=C:\dev\oneapi-tbb-2021.5.0-win\oneapi-tbb-2021.5.0
set EIGEN_INCLUDE_PATH=C:\dev\eigen-3.4.0\build\install\include

call %VCVARSALL_BAT% %ARCH%

mkdir build
cd build

:: runnig CMake
cmake.exe ^
-G "%GENERATOR_NAME%" ^
-A "%ARCH%" ^
-B "%BUILD_DIR%" ^
-D BUILD_CUDA_STUBS=OFF ^
-D BUILD_DOCS=OFF ^
-D BUILD_EXAMPLES=OFF ^
-D BUILD_IPP_IW=ON ^
-D BUILD_ITT=ON ^
-D BUILD_JASPER=ON ^
-D BUILD_JPEG=ON ^
-D BUILD_OPENEXR=ON ^
-D BUILD_PACKAGE=ON ^
-D BUILD_PERF_TESTS=OFF ^
-D BUILD_PNG=ON ^
-D BUILD_PROTOBUF=ON ^
-D BUILD_SHARED_LIBS=ON ^
-D BUILD_TBB=OFF ^
-D BUILD_TESTS=OFF ^
-D BUILD_TIFF=ON ^
-D BUILD_WITH_DEBUG_INFO=ON ^
-D BUILD_WITH_STATIC_CRT=ON ^
-D BUILD_ZLIB=ON ^
-D BUILD_WEBP=ON ^
-D BUILD_opencv_apps=ON ^
-D BUILD_opencv_calib3d=ON ^
-D BUILD_opencv_core=ON ^
-D BUILD_opencv_cudaarithm=OFF ^
-D BUILD_opencv_cudabgsegm=OFF ^
-D BUILD_opencv_cudacodec=OFF ^
-D BUILD_opencv_cudafeatures2d=OFF ^
-D BUILD_opencv_cudafilters=OFF ^
-D BUILD_opencv_cudaimgproc=OFF ^
-D BUILD_opencv_cudalegacy=OFF ^
-D BUILD_opencv_cudaobjdetect=OFF ^
-D BUILD_opencv_cudaoptflow=OFF ^
-D BUILD_opencv_cudastereo=OFF ^
-D BUILD_opencv_cudawarping=OFF ^
-D BUILD_opencv_cudev=OFF ^
-D BUILD_opencv_dnn=ON ^
-D BUILD_opencv_dnn_BUILD_TORCH_IMPORTER=ON ^
-D BUILD_opencv_features2d=ON ^
-D BUILD_opencv_flann=ON ^
-D BUILD_opencv_highgui=ON ^
-D BUILD_opencv_imgcodecs=ON ^
-D BUILD_opencv_imgproc=ON ^
-D BUILD_opencv_java=OFF ^
-D BUILD_opencv_ml=ON ^
-D BUILD_opencv_objdetect=ON ^
-D BUILD_opencv_photo=ON ^
-D BUILD_opencv_python2=OFF ^
-D BUILD_opencv_python3=OFF ^
-D BUILD_opencv_shape=ON ^
-D BUILD_opencv_stitching=ON ^
-D BUILD_opencv_superres=ON ^
-D BUILD_opencv_ts=ON ^
-D BUILD_opencv_video=ON ^
-D BUILD_opencv_videoio=ON ^
-D BUILD_opencv_videostab=ON ^
-D BUILD_opencv_viz=OFF ^
-D BUILD_opencv_world=OFF ^
-D CMAKE_CONFIGURATION_TYPES="Debug;Release" ^
-D CMAKE_INSTALL_PREFIX="%INSTALL_DIR%" ^
-D EIGEN_INCLUDE_PATH="%EIGEN_INCLUDE_PATH%\eigen3" ^
-D TBB_ENV_INCLUDE="%TBB_ROOT%\include" ^
-D TBB_ENV_LIB="%TBB_ROOT%\lib\intel64\vc14\tbb.lib" ^
-D TBB_ENV_LIB_DEBUG="%TBB_ROOT%\lib\intel64\vc14\tbb_debug.lib" ^
-D CPU_BASE_LINE="SSE3" ^
-D CPU_DISPATCH="SSE4_1;SSE4_2;AVX;AVX2;FP16" ^
-D CV_DISABLE_OPTIMIZATION=OFF ^
-D CV_ENABLE_INTRINSICS=ON ^
-D CV_TRACE=ON ^
-D OPENCV_EXTRA_MODULES_PATH=%OPENCV_CONTRIB_MODULE_PATH% ^
-D WITH_1394=OFF ^
-D WITH_CUBLAS=OFF ^
-D WITH_CUDA=OFF ^
-D WITH_CUFFT=OFF ^
-D WITH_DIRECTX=ON ^
-D WITH_DSHOW=ON ^
-D WITH_EIGEN=ON ^
-D WITH_FFMPEG=ON ^
-D WITH_GDAL=OFF ^
-D WITH_GIGEAPI=OFF ^
-D WITH_HALIDE=OFF ^
-D WITH_INTELPERC=OFF ^
-D WITH_IPP=ON ^
-D WITH_IPP_A=OFF ^
-D WITH_ITT=ON ^
-D WITH_JASPER=ON ^
-D WITH_JPEG=ON ^
-D WITH_MFX=OFF ^
-D WITH_MSMF=ON ^
-D WITH_NVCUVID=OFF ^
-D WITH_OPENCL=OFF ^
-D WITH_OPENCLAMDBLAS=OFF ^
-D WITH_OPENCLAMDFFT=OFF ^
-D WITH_OPENCL_SVM=OFF ^
-D WITH_OPENEXR=ON ^
-D WITH_OPENGL=OFF ^
-D WITH_OPENMP=OFF ^
-D WITH_OPENNI=OFF ^
-D WITH_OPENNI2=OFF ^
-D WITH_OPENVX=OFF ^
-D WITH_PNG=ON ^
-D WITH_PVAPI=OFF ^
-D WITH_QT=OFF ^
-D WITH_TBB=ON ^
-D WITH_TIFF=ON ^
-D WITH_VFW=OFF ^
-D WITH_VTK=OFF ^
-D WITH_WEBP=ON ^
-D WITH_WIN32UI=ON ^
-D WITH_XIMEA=OFF %SOURCE_DIR%

:: Building the OpenCV(Debug/Release) using Visual Studio
devenv /build "Debug|x64" /project "INSTALL" OpenCV.sln
devenv /build "Release|x64" /project "INSTALL" OpenCV.sln
