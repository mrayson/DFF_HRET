# DFF_HRET (Date: 2020/07) 

 Creator: Yankun Gong (University of Western Australia)
 
 Email:  Yankun.Gong@research.uwa.edu.au

===========================================================================

1. Dataset in the subfolder ./data/

     (a) HRET_v8.1_compressed.nc:
	 A global satellite data of baroclinic sea surface height(SSH) induced by M2 internal tides:
	 Four key harmonics are included, namely M2, S2, O1 and K1.
   	 The data is a satellite altimetry product (HRET) provided by Zaron (2019).
	 It can be downloaded freely from the internet (http://web.cecs.pdx.edu/~zaron/pub/HRET.html).
			
     (b) Bathy_HRET.nc:
	 Bathymetry data using GEBCO_08, which has been interpolated to fit the grids in the HRET product
	        	   
===========================================================================

2. Scripts and functions

     (a) Extract_HRET:
         Use the given bounds of longitude and latitude to select the interest region. 	 
	   
     (b) DFF_HRET:
         Take the directional Fourier filter (DFF) method to get the wave signal propagating in a certain direction
         (Mercier et al., 2008; Gong et al. 2020).
		 
===========================================================================

3. Examples in the subfolder ./example/
    
     (a) Australian Northwest Shelf: 
         M2 internal tides propagating in the direction with the angle ranging from 90 deg to 200 deg.
	 
     (b) Northern South China Sea: 
         M2 internal tides propagating westward.

===========================================================================

4. Images in the subfolder ./images/
		 
     (a) A global snapshot of baroclinic sea surface height(SSH) induced by M2 internal tides:
   	 The data is a satellite altimetry product (HRET) provided by Zaron (2019).
         13 regions are marked with blue boxes in the global map. 
		 
     (b) SSHbc of internal tides in 13 active regions: 
	 Four key harmonics are included, namely M2, S2, O1 and K1.
         Total internal tide signals are directionally decomposed into four components for all 13 regions 
         (NW, NE, SW and SE; N, S, W and E) using the directional Fourier filter method (Gong et al. 2020).
		 
     (c) These 13 regions include the West Indian Ocean, Bay of Bengal, South China Sea, Philippine Sea, Indonesian Sea, NE Indian Ocean, Coral Sea, Tasman Sea, North Pacific Ocean, South Pacific Ocean, NE Atlantic Ocean, Bay of Biscay and California Coast. 	
		 
===========================================================================

5. References

    Mercier, M.J., Garnier, N.B., Dauxois, T., 2008. Reflection and diffraction of internal waves analyzed with the Hilbert transform. 
      Phys. Fluids. https://doi.org/10.1063/1.2963136
	  
    Zaron, E.D., 2019. Baroclinic Tidal Sea Level from Exact-Repeat Mission Altimetry. 
      J. Phys. Oceanogr. 49, 193–210. https://doi.org/10.1175/jpo-d-18-0127.1

    Gong, Y., Rayson, M.D., Jones, N.L. and Ivey, G.N., 2020. Directional decomposition of internal tides propagating from multiple generation sites.
      Ocean Modelling. (in revision). 
