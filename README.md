# Mathematical Image Analysis

Final project for JHU EN.553.493.

## Functionality Overview ⚙️:

- **Watermark Addition**: Currently supports adding text watermarks. Potential improvements include handling complex text and transparency for platforms like Weibo and Xiaohongshu.
- **Watermark Detection**: Automatic detection of watermarks.
- **Watermark Extraction**: Capability to extract watermarks from images.
- **Watermark Removal**: Removes watermarks from images by impainting.

## Problem Statement
For inpaintng, we have following candidates: 
- **Patch-Based Methods**:
  - Ružic and Pizurica: Used Markov random field (MRF) for well-matched patch search.
  - Jin and Ye: Employed annihilation property filter and low-rank structured matrix. Cited by 128. 
  - Kawai et al.: Selected target objects and limited search to the background for object removal.
  - TSLRA and gradient-based low rank approximation: Used for recovering corrupted blocks.
  - Xue et al.: Proposed depth image inpainting based on Low Gradient Regularization.
  - Liu et al.: Utilized statistical regularization and Markov random field for linear structure extraction.
  - Ding et al.: Used Nonlocal Texture Matching and Alpha-trimmed mean filter for inpainting.
  - Duan et al.: Developed an inpainting approach based on the Non-Local Mumford–Shah model (NL–MS).
  - Fan and Zhang: Introduced an inpainting method using Sum of Squared Differences (SSD).
  - Jiang: Proposed a method for image compression by removing blocks.
  - Alilou and Yaghmaee: Used Singular value decomposition and approximation matrix for reconstruction.
  - Others: Utilized texture analysis, structure information, Saliency Map, Gray entropy, joint probability density matrix (JPDM), etc.

- **Diffusion-Based Methods**:
  - Li et al.: Employed diffusion for inpainting, focusing on localizing diffusion and constructing feature sets.
  - Sridevi et al.: Utilized Fractional-order derivative and Fourier transform for diffusion-based inpainting.

- **Other Approaches**:
  - Wali et al.: Proposed denoising and inpainting using total generalized variation (TGV).
  - Zhang et al.: Introduced example-based image inpainting based on color distribution.
  - Multiscale graph cuts technique: Used for inpainting images by analyzing various distortions.
  - Joint data-hiding and compression scheme using SMVQ and image inpainting.
  - Multiple pyramids method, local patch statistics, and geometric feature-based sparse representation for object removal.


## Dataset
<img width="1000" alt="Screenshot 2024-05-03 at 11 41 19 AM" src="https://github.com/aenorhabditis6/mathematical-image-analysis/assets/117194384/06e1847b-013f-490e-be96-84ffae59c600">

The original dataset from Kaggle contains 50 images. We added the text-based watermark "EN.553.493" to these images at specific locations and change them to black and white. 
<img width="1089" alt="Screenshot 2024-05-03 at 11 42 03 AM" src="https://github.com/aenorhabditis6/mathematical-image-analysis/assets/117194384/805cce6d-732c-479d-9236-37c0b76d4f3c">

Using gradient descent, we were able to recover the watermark from all 50 images:

<img width="600" alt="Recovery" src="https://github.com/aenorhabditis6/mathematical-image-analysis/assets/117194384/199486c2-0621-47b9-b83e-8e7892e8b332.png">

After detection, our algorithm removes the entire rectangular watermark area:

<img width="1108" alt="Screenshot 2024-05-03 at 11 42 32 AM" src="https://github.com/aenorhabditis6/mathematical-image-analysis/assets/117194384/74fbf20c-ca47-4292-a74a-c25bce6bc514">


## Categories 🤔
We are currently focusing on block distortion in image inpainting techniques. We intend to experiment with multiple inpainting techniques for comparison. Additionally, we are exploring text removal as a related problem.
![Inpainting](https://github.com/aenorhabditis6/mathematical-image-analysis/assets/117194384/ef58f8eb-7b1e-4a25-bb99-4c6635d6aac1.png)

## Problem Statement
We first develop an algorithm that investigates how to extract the watermark. Then, we implement 2 algorithms to inpaint the missing area. Check out our pdf for a visual demonstration!

## Authors 🫡
Tina, Lily, Doris. Hats off to us!

## Acknowledgments 😊
The dataset used is the first 50 cat images from Kaggle's [Cat vs. Rabbit dataset](https://www.kaggle.com/datasets/muniryadi/cat-vs-rabbit). We have a soft spot for cats.
