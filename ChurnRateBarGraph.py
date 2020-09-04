#!/usr/bin/env python
# coding: utf-8

# In[1]:


from matplotlib import pyplot as plt
import pandas as pd
import seaborn as sns


# In[3]:


date = ['January', 'February', 'March']
churn_rate_87 = [0.2518, 0.3203, 0.4859]
churn_rate_30 = [0.0756, 0.0734, 0.1173]

# Churn Rate 87
n = 1  # This is our first dataset
t = 2 # Number of dataset
d = 3 # Number of sets of bars
w = 0.8 # Width of each bar
x1 = [t*element + w*n for element in range(d)]
# Here x1 is the list [0.8, 2.8, 4.8, 6.8]

plt.bar(x1, churn_rate_87)

# Churn Rate 30
n = 2  # This is our second dataset
t = 2 # Number of dataset
d = 3 # Number of sets of bars
w = 0.8 # Width of each bar
x2 = [t*element + w*n for element in range(d)]
# Here bars2_x is the list [1.6, 3.6, 5.6, 7.6]

plt.bar(x2, churn_rate_30)

middle_x = [ (a + b) / 2.0 for a, b in zip(x1, x2)]
# Here middle_x is the list [1.2, 3.2, 5.2, 7.2]
labels = ["Segment 87", "Segment 30"]
plt.bar(x2, churn_rate_30)
plt.title("Churn Rates for Segment 87 and 30 overs 3 months")
plt.legend(labels)
plt.xticks(middle_x, date)
plt.savefig("ChurnRateVisualization.png")
plt.show()


# In[ ]:




