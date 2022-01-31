(define (resize filein fileout)
    (let* 
        (
            (image (car (gimp-file-load RUN-NONINTERACTIVE filein "")))
            (layer (car (gimp-layer-new image 1280 1024 RGB-IMAGE "background" 100 LAYER-MODE-NORMAL)))
        )
        (gimp-image-resize image 1280 1024 128 0)
        (gimp-image-add-layer image layer 0)
        (gimp-image-lower-item-to-bottom image layer)
        (gimp-image-merge-visible-layers image EXPAND-AS-NECESSARY)
        (set! layer (car (gimp-image-get-active-layer image)))
        (gimp-file-save RUN-NONINTERACTIVE image layer fileout "")
    )
)
