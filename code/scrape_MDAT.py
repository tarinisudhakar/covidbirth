import requests
import pandas as pd

# Define the base API URL
api_base_url = "https://api.census.gov/data/"

# Define your API key - apply to MDAT for key: https://www.census.gov/content/dam/Census/library/publications/2020/acs/acs_api_handbook_2020_ch02.pdf
api_key = "X"

# Initialize an empty list to store DataFrames for each month
dfs = []

# Define a list of months to retrieve data for (January 2016 to August 2023)
months = pd.date_range(start="2016-01-01", end="2016-01-31", freq="M")
#years = pd.date_range(start="2016", end="2020", freq="A")

# Define the State Code for Alabama
#alabama_state_code = "01"

# Define a list of main U.S. states and their respective state codes, excluding District of Columbia
states = [
    {"name": "Alabama", "code": "01"},
    {"name": "Alaska", "code": "02"},
    {"name": "Arizona", "code": "04"},
    {"name": "Arkansas", "code": "05"},
    {"name": "California", "code": "06"},
    {"name": "Colorado", "code": "08"},
    {"name": "Connecticut", "code": "09"},
    {"name": "Delaware", "code": "10"},
    {"name": "Florida", "code": "12"},
    {"name": "Georgia", "code": "13"},
    {"name": "Hawaii", "code": "15"},
    {"name": "Idaho", "code": "16"},
    {"name": "Illinois", "code": "17"},
    {"name": "Indiana", "code": "18"},
    {"name": "Iowa", "code": "19"},
    {"name": "Kansas", "code": "20"},
    {"name": "Kentucky", "code": "21"},
    {"name": "Louisiana", "code": "22"},
    {"name": "Maine", "code": "23"},
    {"name": "Maryland", "code": "24"},
    {"name": "Massachusetts", "code": "25"},
    {"name": "Michigan", "code": "26"},
    {"name": "Minnesota", "code": "27"},
    {"name": "Mississippi", "code": "28"},
    {"name": "Missouri", "code": "29"},
    {"name": "Montana", "code": "30"},
    {"name": "Nebraska", "code": "31"},
    {"name": "Nevada", "code": "32"},
    {"name": "New Hampshire", "code": "33"},
    {"name": "New Jersey", "code": "34"},
    {"name": "New Mexico", "code": "35"},
    {"name": "New York", "code": "36"},
    {"name": "North Carolina", "code": "37"},
    {"name": "North Dakota", "code": "38"},
    {"name": "Ohio", "code": "39"},
    {"name": "Oklahoma", "code": "40"},
    {"name": "Oregon", "code": "41"},
    {"name": "Pennsylvania", "code": "42"},
    {"name": "Rhode Island", "code": "44"},
    {"name": "South Carolina", "code": "45"},
    {"name": "South Dakota", "code": "46"},
    {"name": "Tennessee", "code": "47"},
    {"name": "Texas", "code": "48"},
    {"name": "Utah", "code": "49"},
    {"name": "Vermont", "code": "50"},
    {"name": "Virginia", "code": "51"},
    {"name": "Washington", "code": "53"},
    {"name": "West Virginia", "code": "54"},
    {"name": "Wisconsin", "code": "55"},
    {"name": "Wyoming", "code": "56"},
]

#Age

for state_info in states:
    state_name = state_info["name"]
    state_code = state_info["code"]
    
    for month in months:
        # Construct the API URL for the specific month and state (Alabama)
        # https://api.census.gov/data/2023/cps/basic/aug?get=PWSSWGT,PESEX,PEEDUCA&ucgid=0400000US01
        
        #Unemployment - 
        api_url = f"{api_base_url}{month.year}/cps/basic/{month.strftime('%b').lower()}?get=PWSSWGT,PWCMPWGT,PRTAGE_RC1,PREMPNOT&ucgid=0400000US{state_code}&recode+PRTAGE_RC1=%7B%22b%22:%22PRTAGE%22,%22d%22:%5B%5B%220%22%5D,%5B%221%22%5D,%5B%222%22%5D,%5B%223%22%5D,%5B%224%22%5D,%5B%225%22%5D,%5B%226%22%5D,%5B%227%22%5D,%5B%228%22%5D,%5B%229%22%5D,%5B%2210%22%5D,%5B%2211%22%5D,%5B%2212%22%5D,%5B%2213%22%5D,%5B%2214%22%5D,%5B%2215%22%5D,%5B%2216%22%5D,%5B%2217%22%5D,%5B%2218%22%5D,%5B%2219%22%5D,%5B%2220%22%5D,%5B%2221%22%5D,%5B%2222%22%5D,%5B%2223%22%5D,%5B%2224%22%5D,%5B%2225%22%5D,%5B%2226%22%5D,%5B%2227%22%5D,%5B%2228%22%5D,%5B%2229%22%5D,%5B%2230%22%5D,%5B%2231%22%5D,%5B%2232%22%5D,%5B%2233%22%5D,%5B%2234%22%5D,%5B%2235%22%5D,%5B%2236%22%5D,%5B%2237%22%5D,%5B%2238%22%5D,%5B%2239%22%5D,%5B%2240%22%5D,%5B%2241%22%5D,%5B%2242%22%5D,%5B%2243%22%5D,%5B%2244%22%5D,%5B%2245%22%5D,%5B%2246%22%5D,%5B%2247%22%5D,%5B%2248%22%5D,%5B%2249%22%5D,%5B%2250%22%5D,%5B%2251%22%5D,%5B%2252%22%5D,%5B%2253%22%5D,%5B%2254%22%5D,%5B%2255%22%5D,%5B%2256%22%5D,%5B%2257%22%5D,%5B%2258%22%5D,%5B%2259%22%5D,%5B%2260%22%5D,%5B%2261%22%5D,%5B%2262%22%5D,%5B%2263%22%5D,%5B%2264%22%5D,%5B%2265%22%5D,%5B%2266%22%5D,%5B%2267%22%5D,%5B%2268%22%5D,%5B%2269%22%5D,%5B%2270%22%5D,%5B%2271%22%5D,%5B%2272%22%5D,%5B%2273%22%5D,%5B%2274%22%5D,%5B%2275%22%5D,%5B%2276%22%5D,%5B%2277%22%5D,%5B%2278%22%5D,%5B%2279%22%5D,%5B%2280%22%5D,%5B%2281%22%5D,%5B%2282%22%5D,%5B%2283%22%5D,%5B%2284%22%5D,%5B%2285%22%5D,%5B%2286%22%5D,%5B%2287%22%5D,%5B%2288%22%5D,%5B%2289%22%5D,%5B%2290%22%5D%5D%7D&key=3087435fe5499df3dd40d316ccff9c7d808e515a"
           
        #Income - 
        #api_url = f"{api_base_url}{year.year}/acs/acs1/pums?get=PWGTP,PERNP&ucgid=0400000US{state_code}&key=3087435fe5499df3dd40d316ccff9c7d808e515a"
        
        print(api_url)

        response = requests.get(api_url)

        # Check if the request was successful (status code 200)
        if response.status_code == 200:
            # Parse the JSON response
            data = response.json()

            # The first row of data contains column names, so we extract it
            column_names = data[0]

            # The rest of the data contains the actual values
            data = data[1:]

            # Create a pandas DataFrame for the current month
            df = pd.DataFrame(data, columns=column_names)

          
            # Convert the "Weights" column to numeric (in case it's stored as strings)
            df["PWCMPWGT"] = pd.to_numeric(df["PWCMPWGT"])
            df["PWSSWGT"] = pd.to_numeric(df["PWSSWGT"])

            df["State"] = state_info["name"]
            df["Year"] = month.year
            df["Month"] = month.month
            df["Full_Month"] = pd.to_datetime(df["Month"], format='%m').dt.strftime('%B')

            # Define a dictionary for renaming sex values
            #sex_mapping = {
            #    "1": "Male",
            #    "2": "Female",
            #}
            
            labor_mapping = {
              "-1": "In Universe, Met No Conditions To Assign",
              "4": "Other Not in labor force (NILF)",
              "3": "Discouraged-Not in labor force (NILF)",
              "2": "Unemployed",
              "1": "Employed"
            }
            # Rename sex values in the DataFrame columns
            df["PREMPNOT"] = df["PREMPNOT"].replace(labor_mapping)
            
            df.rename(columns={str(i): str(i - 1) for i in range(1, 91)}, inplace=True)
        

            # Pivot Employment Status into columns and use Age as a sub-filter, aggregating with "sum"
            pivoted_df = df.pivot_table(index=["State", "Year", "Full_Month"], columns=["PREMPNOT", "PRTAGE_RC1"], values="PWSSWGT", aggfunc="sum")
            #pivoted_df = df.pivot_table(index=["State", "Year"], columns=["PREXPLF"], values="PWCMPWGT", aggfunc="sum")

            # Append the DataFrame for the current month to the list
            dfs.append(pivoted_df)
        else:
            print(f"Failed to retrieve data for {year}. Status code:", response.status_code)

# Concatenate the DataFrames for all months into a single DataFrame
final_df = pd.concat(dfs)

#Final preparation to merge dataset with main dataset
final_df = final_df.reset_index()
final_df = final_df.rename(columns={"Full_Month": "Month"})

orig_df = pd.read_csv('X.csv', low_memory=False)  
final_df_subset = final_df.head(5)
orig_df_subset = orig_df.head(5)

merged_df = pd.merge(orig_df, final_df, on=["State", "Year", "Month"], how='outer')

# Define the file path where you want to save the CSV file
csv_file_path = "Y.csv"

# Save the DataFrame to a CSV file
merged_df.to_csv(csv_file_path, index=False)

# Print a message to confirm that the file has been saved
print(f"DataFrame saved to {csv_file_path}")
