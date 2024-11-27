# read in the data from the csv file and plot the data
import pandas as pd
import matplotlib.pyplot as plt

# read in the data from the csv file
data = pd.read_csv('revisions.csv')

# plot the data
plt.plot(data['file'], data['revisions'], marker='o')
plt.xlabel('File')
plt.ylabel('Number of Revisions')
plt.title('Number of Revisions per File')
plt.xticks(rotation=90)  # Rotate x-axis labels for better readability
plt.tight_layout()  # Adjust layout to make room for x-axis labels
plt.show()

# save the plot to a file
plt.savefig('revisions_plot.png')

# close the plot
plt.close()