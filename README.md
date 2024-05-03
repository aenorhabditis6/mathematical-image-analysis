# Mathematical Image Analysis

This repository stores our attempt at the JHU EN.553.493 final project. It may be a little messy at the moment.

## Functionality Overview ⚙️:

- **Watermark Addition**: Currently supports adding text watermarks. Potential improvements include handling complex text and transparency for platforms like Weibo and Xiaohongshu.
- **Watermark Detection**: Automatic detection of watermarks.
- **Watermark Extraction**: Capability to extract watermarks from images.
- **Watermark Removal**: Removes watermarks from images by impainting.

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

## Authors 🫡
Tina, Lily, Doris. Hats off to us!

## Acknowledgments 😊
The dataset used is the first 50 cat images from Kaggle's [Cat vs. Rabbit dataset](https://www.kaggle.com/datasets/muniryadi/cat-vs-rabbit). We have a soft spot for cats.
