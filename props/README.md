# OpenCVアプリケーション開発用Visual Studioプロパティシート

## 使い方

OpenCVを使用するVisual Studioプロジェクトに対してプロパティシートファイル（propsファイル）を追加します。  
propsファイルに記載されている`OPENCV_INSTALL_DIR`のパスは必要に応じて書き換えてください。

```xml
<OPENCV_INSTALL_DIR>C:\dev\opencv-4.5.5\build\install</OPENCV_INSTALL_DIR>
```

また、OpenCVのビルド設定によって参照するライブラリファイルが変わるため、必要に応じて書き換えてください。

## Visual Studioプロパティシート

### OpenCV 4.5.5

|ファイル名|内容|
|---|---|
| [opencv455.props](opencv455.props) | OpenCV 4.5.5用プロパティシート |
| [opencv455_with_contrib.props](opencv455_with_contrib.props) | OpenCV 4.5.5用プロパティシート（opencv_contribあり） |
| [opencv455_with_cuda_with_contrib.props](opencv455_with_cuda_with_contrib.props) | OpenCV 4.5.5用プロパティシート（opencv_contribあり、WITH_CUDA=ON） |

- Visual Studio 2019、2022対応
- 対応プラットフォームはx64のみ（Win32は未対応）
