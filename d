
[1mFrom:[0m /mnt/c/Users/jdn7d/dsgnr/app/controllers/rooms_controller.rb:13 RoomsController#create:

    [1;34m11[0m: [32mdef[0m [1;34mcreate[0m
    [1;34m12[0m:    @room = [1;34;4mRoom[0m.new(room_params)
 => [1;34m13[0m:    binding.pry
    [1;34m14[0m:    [32mif[0m @room.save
    [1;34m15[0m:       redirect_to room_path(@room)
    [1;34m16[0m:    [32melse[0m 
    [1;34m17[0m:       render [33m:new[0m
    [1;34m18[0m:    [32mend[0m
    [1;34m19[0m: [32mend[0m

