function new_img = pad_image(new_width, new_height, img)
    img_size = size(img);

    if mod(new_height, 2) == 1
        new_height = new_height + 1;
    end

    if mod(new_width, 2) == 1
        new_width = new_width + 1;
    end

    height_diff = floor((new_height - img_size(1)) / 2);
    width_diff = floor((new_width - img_size(2)) / 2);
    
    new_img = padarray(img, [ height_diff width_diff ]);

    new_img = imresize(new_img, [ new_height new_width ]);

end