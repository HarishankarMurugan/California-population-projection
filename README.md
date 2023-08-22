# California-population-projection

•Before getting into this project, first of we have to know about some details of California.
•California was located in the west coast of America.
•There are totally 58 counties in California.
•As per the given dataset from the csv file and online search, the total population of the California in 2010 is 37Millions approx.

### Calculated from the dataset.
![image](https://github.com/HarishankarMurugan/California-population-projection/assets/124061758/73bc454f-3261-43d8-88b8-194152f161a3)

### From the google search.
![image](https://github.com/HarishankarMurugan/California-population-projection/assets/124061758/12d31c51-efc1-4443-8051-c14895f8667c)

## Source of datasets:

•Datasets Source from The Californian Open data portal.
•Now, we are getting the datasets for the from [Californian official website]([https://pages.github.com/](https://dof.ca.gov/forecasting/demographics/projections/)) as CSV file!
•In that file we have these are columns

    1. County code
    2. County Name
    3. Year
    4. Race code
    5. Race name
    6. Gender
    7. Age
    8. Population
    
• We are going to do small visualisation from these.

## Importing the datasets from csv to SQL : 

• So, we are going to download the respective excel.
• In MySQL,
      o We are creating a separate database called ca_population.
      o Then creating a table as pop_proj with those respective columns
      o And importing into the respective database.
• After that, I’m just creating some view tables. For example: 

### The below image is the example of view table,

![image](https://github.com/HarishankarMurugan/California-population-projection/assets/124061758/54180561-d37a-4803-9658-9636767000a8)

## Visualizing the data in tableau :

• By connecting the respective database server to the tableau. We can easily able to visualize the data based on the needs.

## Visualized data images:

• The below images are visualized from the data,

### Population projection for every 5 years.
![every_5years](https://github.com/HarishankarMurugan/California-population-projection/assets/124061758/5b4152fb-419d-4c3d-9d0a-7013877900f1)

### Los Angles county with most population in 2022.

![1](https://github.com/HarishankarMurugan/California-population-projection/assets/124061758/2b4eac5c-38fc-48ac-850c-596dcbfd6234)

### San Diego county with 2nd most population in 2022.

![2](https://github.com/HarishankarMurugan/California-population-projection/assets/124061758/d5658378-1a8f-43b1-894b-385bf9e088ff)


### Orange county with 3rd most population in 2022.

![3](https://github.com/HarishankarMurugan/California-population-projection/assets/124061758/23614cbf-9fea-4c1f-82fc-7976efe0d63d)

### Alpine county with least population in 2022.

![least](https://github.com/HarishankarMurugan/California-population-projection/assets/124061758/200ef6e6-4f9e-4fc0-b97d-58e831a37b1a)

### Population based on race in 2022.

![race_pop](https://github.com/HarishankarMurugan/California-population-projection/assets/124061758/f16f57d5-53f1-41cd-af5f-a977d1d48761)


# And that's it, thank you so much for visiting :)



