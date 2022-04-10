# OpenCVビルドバッチファイル（Visual Studio）

## 使い方

<https://github.com/opencv/opencv/releases>からOpenCVのソースコードをダウンロードして、展開します。  
以降の説明では展開後のディレクトリをopencv-4.5.5とします。

1. `opencv-4.5.5`ディレクトリ以下にOpenCVビルドバッチファイルを配置します
1. コマンドプロンプトで`opencv-4.5.5`ディレクトリをカレントディレクトリにします
1. OpenCVビルドバッチファイルを実行します

## OpenCVビルドバッチファイル

### OpenCV 4.5.5

|ファイル名|内容|
|---|---|
| [opencv4.5.5_build_vs2022_x64.bat](opencv455/opencv4.5.5_build_vs2022_x64.bat) | OpenCV 4.5.5用ビルドバッチファイル |
| [opencv4.5.5_contrib_build_vs2022_x64.bat](opencv455/opencv4.5.5_contrib_build_vs2022_x64.bat) | OpenCV 4.5.5用ビルドバッチファイル（opencv_contribあり） |
| [opencv4.5.5_contrib_cuda_build_vs2022_x64.bat](opencv455/opencv4.5.5_contrib_cuda_build_vs2022_x64.bat) | OpenCV 4.5.5用ビルドバッチファイル（opencv_contribあり、WITH_CUDA=ON） |

- Visual Studio 2022対応
- 対応プラットフォームはx64のみ（Win32は未対応）

## バッチファイルのカスタマイズ方法

### Visual Studioバージョン、エディション

`VC_VERSION`、`VC_VERSION_NUM`、`VS_EDITION`に応じて編集してください。

### Intel TBB

`TBB_ROOT`を必要に応じて編集してください。

### Eigen

`EIGEN_INCLUDE_PATH`を必要に応じて編集してください。

### CUDA

`CUDA_ARCH_BIN`にNVIDIA GPUのCapability番号を指定します。Capability番号は[NVIDIAサイト](https://developer.nvidia.com/cuda-gpus)から調べることができます。  
筆者の環境の場合、GeForce GTX 1060（GPU Capability=6.1）を積んでいるため、`CUDA_ARCH_BIN="6.1"`と指定しています。  
このようにCapability番号を明示的に指定することで動作させるGPU向けのみのコンパイルにとどめることができ、ビルド時間を大きく短縮することができます。

### CMakeオプション

CMakeオプションを必要に応じて編集してください。

