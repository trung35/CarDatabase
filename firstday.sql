-- show avalaible cars--
call show_cars;

-- count total SUVs and Sedans--
select count(type) from all_cars
where type = 'SUV';
-- 92 SUVs --

select count(type) from all_cars
where type = 'Sedan';
-- 80 Sedans -- 

-- count 2021 and 2022 manufactured year -- 
select count(year) from all_cars
where year = '2021';
-- 92 2021 year cars --

select count(year) from all_cars
where year = '2022';
-- 80 2022 year cars--

-- show avalaible exterior and interior colors --
select * from all_cars
group by ex_color;
-- Red, Blue, Orange, Black, Yellow and Gray --

select * from all_cars
group by in_color;
-- Black, Gray, Red and Beige --

-- show min and max price --
select min(price) from all_cars;
-- $15,000 --

select max(price) from all_cars;
-- $60,000 --

-- average price for SUV and Sedan --
select round(avg(price),2) from all_cars
where type = 'SUV';
-- $30,586.96 --

select round(avg(price),2) from all_cars
where type = 'Sedan';
-- $24,150.00 -- 

-- cars by location --
select count(id) as cars_on_the_lot, location from all_cars
group by location;
-- 86 cars at each location -- 

-- count avalaible cars for each model --
select model, count(model) as cars_avalaible from all_cars
group by model;
-- AX:24, DA:12, DN:12, EX:24, CE:32, TE:32, QR: 2, QS:2, SR:4, SW:4, RE:8, RM:16 --

-- calculate average for each model --
select model, round(avg(price),2) as average_price from all_cars
group by model;
-- AX:$34,416.67, DA:$24,833.33, DN:$23,000.00, EX:$36,000.00, CE:$18,187.50, TE:$17,750.00, QR:$33,000.00, QS:$33,000.00, SR:$26,000.00, SW:$25,500.00, RE:$53,000.00, RM:$35,625.00 --

-- calculate avg price for each trim for each type --
select trim, type, round(avg(price),2) as average_price from all_cars
where type = 'SUV'
group by trim;
-- $31,727.27 for base, $36,250.00 for premium and $26,187.50 for limited --

select trim, type, round(avg(price),2) as average_price from all_cars
where type = 'Sedan'
group by trim;
-- $23,500 for base and $24,800.00 for limited --

-- customer orders --

-- wants a SUV, premium trim and black exterior --
select * from all_cars
where type - 'SUV' and trim = 'Premium' and ex_color = 'Black';
-- none avalaible --

-- wants a SUV and black exterior --
select * from all_cars
where type = 'SUV' and ex_color = 'Black';

-- wants a SUV, 2022 year, gray interior and location 1 --
select * from all_cars
where type = 'SUV' and year = '2022' and in_color = 'Gray' and location = '1';

-- wants a sedan, red exterior, gray interior and location 2
select * from all_cars
where type = 'Sedan' and ex_color = 'Red' and in_color = 'Gray' and location = '2';

-- customers bought EX56, QR1, RM21, CE24 and SR4 --
update all_cars
set in_stock = 'Sold' 
where id in ('EX56', 'QR1', 'RM21', 'CE24', 'SR4');

-- customers bought DA27 and EX24 --
update all_cars
set in_stock = 'Sold'
where id in ('DA27', 'EX24');

-- new inventory arrived --
update all_cars
set in_stock = 'Avalaible'
where id in ('EX56', 'RM21');

