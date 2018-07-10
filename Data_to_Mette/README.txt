PSM data from Hyytiälä spring 2014. 
PSM10 was in a container on the ground level and PSM08 in a tower.

Columns in PSM_sizes* files:
1. Time in datenum format
2. Particle concentration for Dp = 2-3 nm (cm-3)
3. -- 1.6-2 nm (cm-3)
4. -- 1.4-1.6 nm (cm-3)
5. -- 1.2-4 nm (cm-3)
6. -- 1-1.2 nm (cm-3)

Size bin limits are also shown on the first row (in nm).

Columns in PSM_cutoffs* files:
1.Time in datenum format
2.Particle concentration for Dp >3 nm
3. -- Dp >2 nm (cm-3)
4. -- Dp >1.6 nm (cm-3)
5. -- Dp >1.4 nm (cm-3)
6. -- Dp >1.2 nm (cm-3)
7. -- Dp >1 nm (cm-3)

Inverted using the inversion script A11_invert_hyde2014 (Gaussian method).
Calibration file: psm_organic_calib-1.txt

Regular background measurements were performed during the measurement campaign, and the background was substracted from the data before the data inversion.

