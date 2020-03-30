h = 1.55 / 1000
dielectric_constant = 4.2
c = 3 * (10 ** 8)
resonant_frequency = 2565 * (10 ** 6)
W = c * ((2 / (dielectric_constant + 1)) ** (1 / 2)) / (2 * resonant_frequency) 
effective_dielectric_constant = (dielectric_constant + 1) / 2 + (dielectric_constant - 1) * ((1 + 12 * h / W) ** (-1 / 2)) / 2 
Delta_L = 0.412 * h * ((effective_dielectric_constant + 0.3) * (W / h + 0.264)) / ((effective_dielectric_constant - 0.258) * (W / h + 0.8))
L = c / (2 * resonant_frequency * ((effective_dielectric_constant) ** (1 / 2))) - 2 * Delta_L
print("resonant frequency = {} MHz\neffective dielectric constant = {}\nDelta L = {} cm\nL = {} cm\nW = {} cm".format(resonant_frequency/(10 ** 6),effective_dielectric_constant,Delta_L*100,L*100,W*100))


