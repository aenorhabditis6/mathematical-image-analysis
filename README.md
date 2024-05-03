# Mathematical-image-analysis
The page to store our attempt of JHU EN.553.493 final projects. Might be a little messy at the moment. 

## Function intended ⚙: 
- watermark addition, simply with text
  - Potential improvement: Complex test, transparent test: Natural platform: Weibo, Xiaohongshu ;)
- watermark detection
  - Currently automatic
- watermark extraction
- watermark removal

## Dataset
<img width="213" alt="image" src="https://github.com/aenorhabditis6/mathematical-image-analysis/assets/117194384/b0111f9d-cf2a-4d7b-8f08-9c74b6db6260">
Original dataset from Kaggle, I add the text-based watermark "EN.553.493" at the specific location. Changing location is intended. 
Using gradient descend, we could recover the watermark from 50 images with same watermark: 
![image](https://github.com/aenorhabditis6/mathematical-image-analysis/assets/117194384/4dc8e185-246e-4f24-9f49-0fbff99276d8)
After detection, our algorithm remove the entire rectangle watermark area: 
![image](https://github.com/aenorhabditis6/mathematical-image-analysis/assets/117194384/b3e3e285-e3b5-4727-ac3a-5d3a361aa48b)


## Catagories 🤔
Based on general review of image inpainting techniques, we are currently dealing with block distortion. We intend to try multiple inpainting technique to compare the result. Currently, there are
However, notice that this could be transfer to a text removal problem, and we are working on that. 
![WechatIMG240](https://github.com/aenorhabditis6/mathematical-image-analysis/assets/117194384/ef58f8eb-7b1e-4a25-bb99-4c6635d6aac1)


## Authors 🫡
Tina, Lily, Doris. Hats off to us.



## Acknowledgments 😊
The dataset I chose is the first 50 cat images from Kaggle https://www.kaggle.com/datasets/muniryadi/cat-vs-rabbit. I like cat a bit more. 
