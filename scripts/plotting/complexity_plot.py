# read in the data from the csv file and plot the data
import pandas as pd
import matplotlib.pyplot as plt
import sys

input_csv_file = sys.argv[1]
output_png = sys.argv[2]

# read in the data from the csv file
data = pd.read_csv(input_csv_file)

# plot the data
plt.plot(data['rev'], data['total'], marker='o')
plt.xlabel('Commit')
plt.ylabel('Total complexity')
plt.title('Complexity trend for ' + input_csv_file)
plt.xticks(rotation=45)  # Rotate x-axis labels for better readability
plt.tight_layout()  # Adjust layout to make room for x-axis labels
# plt.show()

# save the plot to a file
plt.savefig(output_png)

# close the plot
plt.close()
