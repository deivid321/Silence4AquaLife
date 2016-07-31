import pandas 
import pylab as plt
import numpy as np

df = pandas.read_csv("acceleration.csv")
#df = df[1500:].reset_index()
t = df["Time since start in ms "]*1e-3
ax = df["ACCELEROMETER X (m/s²)"]
ay = df["ACCELEROMETER Y (m/s²)"]
az = df["ACCELEROMETER Z (m/s²)"]

g = 9.81
a = sqrt(ax**2 + ay**2 + az**2) - g

### A simple Eiler integrator
v = [0,]
pos = [0,]    
vi = 0
posi = 0

for i in range(1,len(t)):
    posi = (t[i]-t[i-1])*v[i-1]
    vi += (t[i]-t[i-1])*a[i-1]
    
    pos.append(posi)
    v.append(vi)

# Normalise data (Need to make it windowed)

windowsize = len(t) # elements

s = 0
for i in range(1,windowsize):
    s += (t[i]-t[i-1])*pos[i]

DT0 = t[windowsize-1] - t[0]
for i in range(1,windowsize):
    pos[i] = pos[i] - (t[i]-t[0])*s/DT0**2*2

    
plt.plot(t-t[0],pos)

fre = np.fft.rfft(pos)
fre[200:] = 0
fre[:10] = 0
posin = irfft(fre)

power = abs(fre)**2

plt.plot((t-t[0])[1:],posin,lw=4)

### Saving a table

df["a"] = a
df["pos"] = posin.tolist() + [0]
df["X"] = ax
df["Y"] = ay
df["Z"] = az
df["date"] = df["YYYY-MO-DD HH-MI-SS_SSS"]
df["DB"] = df["SOUND LEVEL (dB)"]

#df["DB"] = df.rename(columns={"SOUND LEVEL (dB)":"DB","ACCELEROMETER X (m/s²)":"X", "ACCELEROMETER Y (m/s²)":"Y", "ACCELEROMETER Z (m/s²)":"Z"})

df[["date","X","Y","Z","DB","a","pos"]].to_csv("output.csv",index=False)

