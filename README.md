# IPL-ANALYSIS
Problem Definition

The Indian Premier League (IPL) generates massive volumes of cricket data every season, including match results, ball-by-ball commentary, player performances, and team statistics.
While fans and analysts have access to raw data, extracting actionable insights such as:

Which players are most consistent?

How toss decisions affect match results?

Which venues favor batting/bowling?

Which teams dominate across seasons?

…is not straightforward without systematic data analysis.

Hence, the problem is:
👉 “How can we analyze IPL historical data to identify patterns in team performances, player achievements (Orange Cap, Purple Cap), and match outcomes (toss decisions, venues, result types) using PostgreSQL and visualize them in Power BI?”

🎯 Objectives of the Project

Data Management & Integration

Collect IPL data (matches, ball-by-ball, players).

Store and query efficiently using PostgreSQL.

Player Performance Analysis

Identify top run-scorers (Orange Cap).

Identify top wicket-takers (Purple Cap).

Calculate batting strike rates, averages, boundary counts, economy rates for bowlers.

Team & Season Analysis

Determine season champions and team-wise wins.

Compare team performance across different venues.

Highlight consistent franchises (e.g., MI, CSK).

Match Outcome Factors

Analyze the impact of toss decisions (bat/field first) on results.

Explore win patterns by result type (runs, wickets, super over).

Venue Analysis

Identify which stadiums favor batting vs. bowling.

Highlight home advantage impact.

Visualization (Dashboard in Power BI)

Create a Season Overview: Title Winner, Orange Cap, Purple Cap, Total 4s & 6s.

Player Stats Pages: Select Batsman, Select Bowler cards.

Match Insights: Wins by Venue, Toss Impact, Result Type.

Team Analysis: Team-wise wins across seasons.

✅ Expected Outcome:

A structured PostgreSQL database with IPL data.

SQL queries to extract meaningful insights.

A Power BI Dashboard that presents IPL stats in an interactive, user-friendly manner.

Actionable insights for cricket fans, analysts, and teams.
REQUIREMENT

Develop a IPL Dashboard for season 2008 to 2022 to have a detailed insight on below

problem statements

Fine the Title Winner, Orange Cap Winner, Purple Cap Winner, Tournament 6's and 4's for the respective seasons on IPL

Develop IPL Batting and Bowling statrand add a filter where user can select the bowler and batsman to see these stats.

Winning percentage based on the toss decision

Matches win by venue

Total wins by team in a season

IPL

Matches won based on the result type
STAKEHOLDERS

BCCI

Franchise/Team Owners

Team Management

Coaches

Players

➤ Media

Public

POWER BI FUNCTIONALITIES  WILL LEARN

How to connect Power BI to mysql workbench and PostgreSQL

Data Modelling with three tables

Data cleaning in Power Query

Time Intelligence function

>Creating KPI's

Dax Queries

TATA

Creating and Formatting charts

Different DAX functions like Calculate, Sum, Sumx, Filter, Allselected, values, selectedvalue, return, concatenate, divide, etc

Creating different shapes and formatting

Generating insights from charts

Export report
dashboard :
<img width="1301" height="704" alt="image" src="https://github.com/user-attachments/assets/745cd4f6-1c56-412f-88cb-fa4666d7e67b" />
data cleaning and preparing:
Import

Home ➜ Get Data ➜ Text/CSV ➜ load ipl_matches_2008_2022.csv.

Click Transform Data to open Power Query.

Profile the data

View ➜ turn on Column quality, Column distribution, Column profile.

Scan for nulls, errors, unexpected categories (e.g., team name variants).

Set correct data types

Select columns ➜ Data type:

id = Whole number, season = Whole number (or Text if non-numeric),

date = Date, numeric margins = Whole number,

text fields (teams, venue, umpires) = Text.

Fix any Error values: Home ➜ Remove Errors.

Trim & standardize text

Transform ➜ Format ➜ Trim and Clean on all text columns.

Transform ➜ Replace Values to unify team names
(e.g., “Delhi Daredevils” → “Delhi Capitals”, “Deccan Chargers” → “Sunrisers Hyderabad”).
Do this for team1, team2, winner, toss_winner.

Handle missing values

Home ➜ Remove rows ➜ Remove blank rows (if any).

Transform ➜ Replace Values: set winner = “No Result” where null; unknown umpires = “Unknown”.

Keep dl_applied as 0/1 (or convert to True/False).

Remove duplicates

Home ➜ Remove rows ➜ Remove duplicates using id (or season, date, team1, team2 if no unique id).

Create helpful derived columns

Won By (Runs/Wickets/NoResult)
Add Column ➜ Custom Column:

if [win_by_runs] > 0 then "Runs" 
else if [win_by_wickets] > 0 then "Wickets" 
else "NoResult"


Toss Winner = Match Winner (Yes/No)

if [winner] = [toss_winner] then "Yes" else "No"


Season (from date) – if missing
Add Column ➜ Date ➜ Year ➜ Year.

Normalize structure (optional but recommended)

Home ➜ Reference the main query to build small dimension tables:

dimTeams: keep team names ➜ Remove duplicates.

dimVenues: keep venue ➜ Remove duplicates.

Keep the original as your FactMatches table.

Load to model

Home ➜ Close & Apply.

Model & DAX (quick starters)

Model view ➜ create relationships from FactMatches to dims (by team/venue name or surrogate keys).

Create a Calendar:

Calendar = CALENDAR ( DATE(2008,1,1), DATE(2022,12,31) )
Year = YEAR(Calendar[Date])


Example measures:

Total Matches = COUNTROWS(FactMatches)
Wins by Team = COUNTROWS(FILTER(FactMatches, FactMatches[winner] = SELECTEDVALUE(dimTeams[Team])))
Toss Helped % = 
  DIVIDE(
    CALCULATE(COUNTROWS(FactMatches), FactMatches[Toss Winner = Match Winner] = "Yes"),
    [Total Matches]
  )


Document the steps

Every action you took appears as a step in Applied Steps (right pane).
Rename steps meaningfully (e.g., “Standardize team names”, “Add WonBy”).

Refresh & validate

Home ➜ Refresh.

Spot-check visuals (bar charts for wins by team, donut for toss decision impact, etc.).
data visualization:
Data Visualization in Power BI – IPL Dataset
🔹 1. Define Objectives

Identify key insights needed:

Winning trends across seasons

Top players (Orange/Purple Cap)

Impact of toss on match results

Venue-wise performance

Team-wise success

🔹 2. Choose Right Chart Types

KPIs / Cards

Title Winner, Orange Cap, Purple Cap, Total Runs, Total Wickets, 4’s & 6’s.

Bar / Column Charts

Wins by team

Runs/wickets by season

Venue-wise match results

Donut / Pie Charts

Toss decision impact (bat vs field)

Win by runs vs wickets vs no result

Line Chart

Trends over seasons (e.g., average runs per match).

Table / Matrix

Player of match awards list

Season summary (matches, winners, margins).

🔹 3. Build Dashboard Layout

Top Section (KPIs) → Title winner, Orange/Purple Cap, total boundaries, etc.

Left Panel (Batting Stats) → Runs, 4’s, 6’s, strike rate.

Right Panel (Bowling Stats) → Wickets, economy, average, strike rate.

Bottom Section (Charts) → Team-wise wins, toss impact, venue analysis.

🔹 4. Add Interactivity

Slicers for season, team, player.

Drill-through pages for player details or season summary.

Tooltip visuals (hover to see details like winning margin).

🔹 5. Formatting & Design

Use team colors/logos for clarity.

Maintain consistent theme (yellow/green in your example).

Add icons/illustrations (bat for batting stats, ball for bowling stats).

Keep charts aligned, with meaningful titles.

🔹 6. Example Visuals (from your screenshot)

KPI Cards → Gujarat Titans (Title Winner), V. Kohli (Orange Cap), DJ Bravo (Purple Cap).

Donut Chart → Toss decision impact.

Bar Chart → Matches won by teams.

Stacked Bar Chart → Venue-wise win type (Runs/Wickets/No Result).
insights and interpretations:
IPL Data Insights & Interpretations
🔹 1. Overall Tournament Trends

Across 2008–2022, scoring has steadily increased, with more boundaries (4’s & 6’s), showing the rise of aggressive batting.

The tournament has become more competitive — no single team dominates all seasons.

🔹 2. Team Performance

Mumbai Indians (MI) and Chennai Super Kings (CSK) are the most successful franchises with the highest number of wins.

Newer teams like Gujarat Titans have made a strong impact (winning the title in debut season 2022).

Teams with stable cores (MI, CSK, KKR) consistently reach playoffs.

🔹 3. Toss & Match Outcomes

Teams winning the toss do not always win the match (less than 50% conversion).

Fielding first has been a slightly more successful toss decision, especially in high-pressure games.

Interpretation → Toss gives some advantage, but performance still decides the result.

🔹 4. Player Performances

Orange Cap (Batting Leaders): Players like Virat Kohli have scored the most runs, showing consistency across multiple seasons.

Purple Cap (Bowling Leaders): Bowlers like Dwayne Bravo dominate wickets tally, proving the impact of death-over specialists.

Player of the Match awards concentrate around all-rounders, highlighting their dual contribution.

🔹 5. Venue Analysis

Certain stadiums (e.g., Eden Gardens, Wankhede, Chinnaswamy) have hosted the highest number of matches.

Chinnaswamy Stadium shows higher 6’s due to shorter boundaries → more batting-friendly.

Wankhede & Chennai favor bowlers due to pitch conditions.

Interpretation → Venue conditions strongly influence match results and strategies.

🔹 6. Match Results & Margins

Majority of matches are won by wickets when chasing, showing the trend of successful chases in IPL.

Some of the largest wins by runs come at batting-friendly pitches (Delhi, Bengaluru).

“No Results” are rare but usually due to rain interruptions.

🔹 7. Evolution of IPL

Introduction of new franchises reshaped competition (e.g., Gujarat Titans’ quick success).

Shift in playing style: more boundaries, more power hitters, higher strike rates.

Data shows IPL has become not just a batsman’s game — bowlers like Bravo, Malinga, Rashid Khan, and Bumrah prove that wicket-taking is crucial for title-winning teams.

✅ Interpretation for Stakeholders:

Teams/Coaches → can use insights to plan toss strategies, venue-specific lineups, and batting orders.

Fans/Media → understand why some players/teams dominate headlines.

Sponsors/Organizers → identify star performers and key venues for branding.
