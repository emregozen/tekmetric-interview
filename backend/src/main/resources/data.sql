-- Clear existing data first to ensure we have exactly 100 records
DELETE FROM repair_services;

-- Insert 100 sample repair service records
INSERT INTO repair_services (customer_name, customer_phone, vehicle_make, vehicle_model, vehicle_year, license_plate, service_description, odometer_reading, status) VALUES
('John Doe', '5551234567', 'Toyota', 'Camry', 2020, 'ABC123', 'Oil change and tire rotation', 35000, 'PENDING'),
('Jane Smith', '5559876543', 'Honda', 'Accord', 2019, 'XYZ789', 'Brake pad replacement', 45000, 'IN_PROGRESS'),
('Bob Johnson', '5552223333', 'Ford', 'F-150', 2018, 'DEF456', 'Engine diagnostic', 60000, 'DIAGNOSED'),
('Alice Williams', '5554445555', 'Chevrolet', 'Malibu', 2021, 'GHI789', 'Air conditioning repair', 15000, 'COMPLETED'),
('Charlie Brown', '5556667777', 'Nissan', 'Altima', 2017, 'JKL012', 'Transmission fluid change', 55000, 'PENDING'),
('Diana Prince', '5558889999', 'Hyundai', 'Sonata', 2022, 'MNO345', 'Battery replacement', 8000, 'COMPLETED'),
('Ethan Hunt', '5551112222', 'Kia', 'Optima', 2019, 'PQR678', 'Wheel alignment', 32000, 'IN_PROGRESS'),
('Fiona Gallagher', '5553334444', 'Mazda', 'CX-5', 2020, 'STU901', 'Spark plug replacement', 28000, 'DIAGNOSED'),
('George Miller', '5555556666', 'Subaru', 'Outback', 2018, 'VWX234', 'Timing belt replacement', 65000, 'PENDING'),
('Hannah Baker', '5557778888', 'Volkswagen', 'Jetta', 2021, 'YZA567', 'Headlight bulb replacement', 12000, 'COMPLETED'),
('Ian Malcolm', '5559990000', 'Audi', 'A4', 2019, 'BCD890', 'Fuel system cleaning', 40000, 'IN_PROGRESS'),
('Julia Roberts', '5552223333', 'BMW', '3 Series', 2020, 'EFG123', 'Brake fluid flush', 25000, 'DIAGNOSED'),
('Kevin Hart', '5554445555', 'Mercedes-Benz', 'C-Class', 2018, 'HIJ456', 'Power steering fluid change', 50000, 'PENDING'),
('Laura Palmer', '5556667777', 'Lexus', 'ES', 2022, 'KLM789', 'Windshield wiper replacement', 5000, 'COMPLETED'),
('Michael Scott', '5558889999', 'Acura', 'TLX', 2019, 'NOP012', 'Coolant flush', 35000, 'IN_PROGRESS'),
('Nancy Wheeler', '5551112222', 'Infiniti', 'Q50', 2020, 'QRS345', 'Air filter replacement', 20000, 'DIAGNOSED'),
('Oscar Martinez', '5553334444', 'Volvo', 'XC60', 2018, 'TUV678', 'Suspension repair', 55000, 'PENDING'),
('Pam Beesly', '5555556666', 'Jeep', 'Grand Cherokee', 2021, 'WXY901', 'Oil leak repair', 18000, 'COMPLETED'),
('Quincy Jones', '5557778888', 'Chrysler', '300', 2017, 'ZAB234', 'Alternator replacement', 62000, 'IN_PROGRESS'),
('Rachel Green', '5559990000', 'Dodge', 'Charger', 2019, 'CDE567', 'Exhaust system repair', 38000, 'DIAGNOSED'),
('Steve Rogers', '5552223333', 'GMC', 'Sierra', 2020, 'FGH890', 'Differential fluid change', 30000, 'PENDING'),
('Tina Fey', '5554445555', 'Buick', 'Enclave', 2018, 'IJK123', 'Tire replacement', 48000, 'COMPLETED'),
('Ulysses Grant', '5556667777', 'Lincoln', 'Navigator', 2022, 'LMN456', 'Cabin air filter replacement', 10000, 'IN_PROGRESS'),
('Victoria Secret', '5558889999', 'Cadillac', 'Escalade', 2019, 'OPQ789', 'Brake caliper replacement', 42000, 'DIAGNOSED'),
('Walter White', '5551112222', 'Tesla', 'Model 3', 2021, 'RST012', 'Battery diagnostic', 15000, 'PENDING'),
('Xena Warrior', '5553334444', 'Porsche', '911', 2020, 'UVW345', 'Performance tuning', 20000, 'COMPLETED'),
('Yoda Master', '5555556666', 'Land Rover', 'Range Rover', 2018, 'XYZ678', 'Suspension lift installation', 55000, 'IN_PROGRESS'),
('Zack Morris', '5557778888', 'Jaguar', 'F-Type', 2019, 'ABC901', 'Convertible top repair', 30000, 'DIAGNOSED'),
('Amy Santiago', '5559990000', 'Mini', 'Cooper', 2022, 'DEF234', 'Clutch replacement', 12000, 'PENDING'),
('Bruce Wayne', '5552223333', 'Bentley', 'Continental', 2020, 'GHI567', 'Luxury detail service', 18000, 'COMPLETED'),
('Chloe Decker', '5554445555', 'Maserati', 'Ghibli', 2019, 'JKL890', 'Engine tune-up', 25000, 'IN_PROGRESS'),
('Dwight Schrute', '5556667777', 'Ferrari', '488', 2021, 'MNO123', 'High-performance brake upgrade', 8000, 'DIAGNOSED'),
('Emma Swan', '5558889999', 'Lamborghini', 'Huracan', 2020, 'PQR456', 'Custom exhaust installation', 10000, 'PENDING'),
('Frank Castle', '5551112222', 'Aston Martin', 'DB11', 2019, 'STU789', 'Interior restoration', 22000, 'COMPLETED'),
('Gina Linetti', '5553334444', 'Rolls-Royce', 'Ghost', 2018, 'VWX012', 'Luxury maintenance package', 15000, 'IN_PROGRESS'),
('Homer Simpson', '5555556666', 'Toyota', 'Corolla', 2022, 'YZA345', 'Basic maintenance service', 5000, 'DIAGNOSED'),
('Irene Adler', '5557778888', 'Honda', 'Civic', 2020, 'BCD678', 'Timing chain replacement', 35000, 'PENDING'),
('Jake Peralta', '5559990000', 'Ford', 'Mustang', 2019, 'EFG901', 'Performance package installation', 28000, 'COMPLETED'),
('Kim Possible', '5552223333', 'Chevrolet', 'Corvette', 2021, 'HIJ234', 'Custom wheel installation', 12000, 'IN_PROGRESS'),
('Luke Skywalker', '5554445555', 'Nissan', 'GT-R', 2020, 'KLM567', 'Turbo upgrade', 18000, 'DIAGNOSED'),
('Marge Simpson', '5556667777', 'Hyundai', 'Elantra', 2018, 'NOP890', 'Transmission repair', 60000, 'PENDING'),
('Nick Fury', '5558889999', 'Kia', 'Soul', 2022, 'QRS123', 'Speaker system upgrade', 8000, 'COMPLETED'),
('Olivia Pope', '5551112222', 'Mazda', 'Miata', 2019, 'TUV456', 'Convertible top replacement', 25000, 'IN_PROGRESS'),
('Peter Parker', '5553334444', 'Subaru', 'WRX', 2020, 'WXY789', 'Turbo maintenance', 30000, 'DIAGNOSED'),
('Quinn Fabray', '5555556666', 'Volkswagen', 'Golf', 2018, 'ZAB012', 'DSG transmission service', 45000, 'PENDING'),
('Ron Swanson', '5557778888', 'Audi', 'S4', 2021, 'CDE345', 'Performance chip installation', 15000, 'COMPLETED'),
('Sansa Stark', '5559990000', 'BMW', 'M3', 2019, 'FGH678', 'Track day preparation', 28000, 'IN_PROGRESS'),
('Tony Stark', '5552223333', 'Mercedes-Benz', 'AMG GT', 2020, 'IJK901', 'Custom paint job', 10000, 'DIAGNOSED'),
('Uma Thurman', '5554445555', 'Lexus', 'LC', 2018, 'LMN234', 'Leather seat restoration', 35000, 'PENDING'),
('Vincent Vega', '5556667777', 'Acura', 'NSX', 2022, 'OPQ567', 'Ceramic coating application', 5000, 'COMPLETED'),
('Wanda Maximoff', '5558889999', 'Infiniti', 'Q60', 2019, 'RST890', 'Window tinting', 22000, 'IN_PROGRESS'),
('Xavier Charles', '5551112222', 'Volvo', 'S60', 2020, 'UVW123', 'Safety system calibration', 18000, 'DIAGNOSED'),
('Yvonne Strahovski', '5553334444', 'Jeep', 'Wrangler', 2018, 'XYZ456', 'Lift kit installation', 40000, 'PENDING'),
('Zendaya Coleman', '5555556666', 'Chrysler', 'Pacifica', 2021, 'ABC789', 'Family vehicle detail', 15000, 'COMPLETED'),
('Aaron Paul', '5557778888', 'Dodge', 'Challenger', 2019, 'DEF012', 'Muscle car tune-up', 32000, 'IN_PROGRESS'),
('Bella Hadid', '5559990000', 'GMC', 'Yukon', 2020, 'GHI345', 'Towing package installation', 25000, 'DIAGNOSED'),
('Chris Hemsworth', '5552223333', 'Buick', 'LaCrosse', 2018, 'JKL678', 'Comfort package upgrade', 50000, 'PENDING'),
('Daisy Ridley', '5554445555', 'Lincoln', 'Aviator', 2022, 'MNO901', 'Luxury detail service', 8000, 'COMPLETED'),
('Ezra Miller', '5556667777', 'Cadillac', 'CT5', 2019, 'PQR234', 'Premium sound system installation', 30000, 'IN_PROGRESS'),
('Felicity Jones', '5558889999', 'Tesla', 'Model S', 2020, 'STU567', 'Electric system diagnostic', 20000, 'DIAGNOSED'),
('Gal Gadot', '5551112222', 'Porsche', 'Cayenne', 2018, 'VWX890', 'Sport package upgrade', 45000, 'PENDING'),
('Henry Cavill', '5553334444', 'Land Rover', 'Discovery', 2021, 'YZA123', 'Off-road package installation', 12000, 'COMPLETED'),
('Idris Elba', '5555556666', 'Jaguar', 'XF', 2019, 'BCD456', 'Luxury maintenance service', 28000, 'IN_PROGRESS'),
('Jennifer Lawrence', '5557778888', 'Mini', 'Countryman', 2020, 'EFG789', 'All-wheel drive service', 22000, 'DIAGNOSED'),
('Kit Harington', '5559990000', 'Bentley', 'Bentayga', 2018, 'HIJ012', 'Premium detail package', 35000, 'PENDING'),
('Lena Headey', '5552223333', 'Maserati', 'Levante', 2022, 'KLM345', 'Italian sports tune-up', 5000, 'COMPLETED'),
('Maisie Williams', '5554445555', 'Ferrari', 'Roma', 2020, 'NOP678', 'Exotic car maintenance', 10000, 'IN_PROGRESS'),
('Natalie Portman', '5556667777', 'Lamborghini', 'Urus', 2019, 'QRS901', 'Performance SUV service', 18000, 'DIAGNOSED'),
('Orlando Bloom', '5558889999', 'Aston Martin', 'Vantage', 2021, 'TUV234', 'Sports car preparation', 8000, 'PENDING'),
('Priyanka Chopra', '5551112222', 'Rolls-Royce', 'Cullinan', 2020, 'WXY567', 'Ultra-luxury maintenance', 15000, 'COMPLETED'),
('Quentin Tarantino', '5553334444', 'Toyota', 'Supra', 2019, 'ZAB890', 'Performance upgrade package', 25000, 'IN_PROGRESS'),
('Ryan Reynolds', '5555556666', 'Honda', 'CR-V', 2018, 'CDE123', 'Family SUV maintenance', 55000, 'DIAGNOSED'),
('Scarlett Johansson', '5557778888', 'Ford', 'Explorer', 2022, 'FGH456', 'Three-row SUV service', 10000, 'PENDING'),
('Tom Holland', '5559990000', 'Chevrolet', 'Silverado', 2020, 'IJK789', 'Truck maintenance package', 28000, 'COMPLETED'),
('Uma Thurman', '5552223333', 'Nissan', 'Rogue', 2019, 'LMN012', 'Crossover SUV service', 35000, 'IN_PROGRESS'),
('Vin Diesel', '5554445555', 'Hyundai', 'Tucson', 2021, 'OPQ345', 'Compact SUV maintenance', 12000, 'DIAGNOSED'),
('Winona Ryder', '5556667777', 'Kia', 'Telluride', 2020, 'RST678', 'Family SUV detail package', 18000, 'PENDING'),
('Xander Cage', '5558889999', 'Mazda', 'CX-9', 2018, 'UVW901', 'Three-row crossover service', 48000, 'COMPLETED'),
('Yara Shahidi', '5551112222', 'Subaru', 'Forester', 2022, 'XYZ234', 'All-wheel drive maintenance', 8000, 'IN_PROGRESS'),
('Zac Efron', '5553334444', 'Volkswagen', 'Tiguan', 2019, 'ABC567', 'European SUV service', 30000, 'DIAGNOSED'),
('Anna Kendrick', '5555556666', 'Audi', 'Q5', 2020, 'DEF890', 'Luxury crossover maintenance', 22000, 'PENDING'),
('Bradley Cooper', '5557778888', 'BMW', 'X5', 2018, 'GHI123', 'German SUV service package', 55000, 'COMPLETED'),
('Cate Blanchett', '5559990000', 'Mercedes-Benz', 'GLE', 2021, 'JKL456', 'Luxury SUV detail', 15000, 'IN_PROGRESS'),
('Daniel Craig', '5552223333', 'Lexus', 'RX', 2019, 'MNO789', 'Premium crossover service', 32000, 'DIAGNOSED'),
('Emma Stone', '5554445555', 'Acura', 'MDX', 2020, 'PQR012', 'Three-row luxury maintenance', 25000, 'PENDING'),
('Finn Wolfhard', '5556667777', 'Infiniti', 'QX60', 2018, 'STU345', 'Family luxury vehicle service', 45000, 'COMPLETED'),
('Greta Gerwig', '5558889999', 'Volvo', 'XC90', 2022, 'VWX678', 'Scandinavian SUV maintenance', 10000, 'IN_PROGRESS'),
('Hugh Jackman', '5551112222', 'Jeep', 'Cherokee', 2019, 'YZA901', 'Off-road capability service', 28000, 'DIAGNOSED'),
('Isla Fisher', '5553334444', 'Chrysler', 'Voyager', 2020, 'BCD234', 'Minivan maintenance package', 20000, 'PENDING'),
('Jason Momoa', '5555556666', 'Dodge', 'Durango', 2018, 'EFG567', 'Performance SUV tune-up', 50000, 'COMPLETED'),
('Kristen Bell', '5557778888', 'GMC', 'Acadia', 2021, 'HIJ890', 'Mid-size SUV service', 12000, 'IN_PROGRESS'),
('Leonardo DiCaprio', '5559990000', 'Buick', 'Encore', 2019, 'KLM123', 'Compact luxury crossover maintenance', 35000, 'DIAGNOSED'),
('Margot Robbie', '5552223333', 'Lincoln', 'Corsair', 2020, 'NOP456', 'American luxury service', 22000, 'PENDING'),
('Noah Centineo', '5554445555', 'Cadillac', 'XT5', 2018, 'QRS789', 'Premium crossover detail', 48000, 'COMPLETED'),
('Olivia Wilde', '5556667777', 'Tesla', 'Model X', 2022, 'TUV012', 'Electric SUV maintenance', 8000, 'IN_PROGRESS'),
('Pedro Pascal', '5558889999', 'Porsche', 'Macan', 2020, 'WXY345', 'Sport SUV performance service', 18000, 'DIAGNOSED'),
('Queen Latifah', '5551112222', 'Land Rover', 'Defender', 2019, 'ZAB678', 'Off-road vehicle preparation', 25000, 'PENDING');