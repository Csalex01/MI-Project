function new_img = pad_image(new_width, new_height, img)
    img_size = size(img);

%     disp(img_size(2) + " " + img_size(1));
%     disp(new_width + " " + new_height);
%     disp(" ");

    height_diff = floor(new_height - img_size(1));
    width_diff = floor(new_width - img_size(2));
    
    new_img = padarray(img, [ height_diff width_diff ]);
end