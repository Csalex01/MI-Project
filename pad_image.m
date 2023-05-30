function new_img = pad_image(new_width, new_height, img)

    % Kép méretének meghatározása
    img_size = size(img);

    % Kép -> Négyzet
    if new_width > new_height
        
        new_height = new_width;
    
    elseif new_height > new_width
    
        new_width = new_height;
        
    end

    % Szélesség és magasság különbségeinek meghatározása
    height_diff = floor((new_height - img_size(1)) / 2);
    width_diff = floor((new_width - img_size(2)) / 2);
    
    % Kép párnázása illetve méretezése
    new_img = padarray(img, [ height_diff width_diff ]);
    new_img = imresize(new_img, [ new_height new_width ]);

end