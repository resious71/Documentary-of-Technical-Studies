### 모자이크 플롯 
#  - 다중변수, 범주형 데이터에 대해 각 변수의 그룹별 비율을 면적으로 표시

head(mtcars)
mosaicplot(~gear+vs,
            data = mtcars,
            color = TRUE,
            main = "Gear and Engine"
           )


mosaicplot(~cyl+gear,
           data = mtcars,
           color = c("green", "red"),
           main = "Gear and Engine"
)


HairEyeColor
mosaicplot(HairEyeColor,
           color = c("blue", "pink"),
           main = "Hair and Eye Color"
)


