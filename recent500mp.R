url_rec <- "https://www.cars.co.za/searchVehicle.php?new_or_used=&make_model=&vfs_area=&agent_locality=&price_range=&os=&locality=&commercial_type=&body_type_exact=&transmission=&fuel_type=&login_type=&mapped_colour=&vfs_year=&vfs_mileage=&vehicle_axle_config=&keyword=&sort=vfs_time_d&P=%d"

library(rvest)
library(purrr)
library(tidyr)

map_df(1:500, function(i){
        page <- read_html(sprintf(url_rec, i))
        data.frame(model=html_text(trim=T,html_nodes(page, ".vehicle-list__vehicle-name")),
                   price=html_text(htrim=T,tml_nodes(page,".vehicle-list__vehicle-price")))
}) ->recentMPdata