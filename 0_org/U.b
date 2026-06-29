/*--------------------------------*- C++ -*----------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  v2506                                 |
|   \\  /    A nd           | Website:  www.openfoam.com                      |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/

FoamFile
{
    version     2.0;
    format      ascii;
    class       volVectorField;
    location    "0";
    object      U.b;
}
// ************************************************************************* //

dimensions      [0 1 -1 0 0 0 0];

internalField   uniform (0 0 0); //0.233m/s
boundaryField
{
    inletWater
    {
        // Log-law velocity profile matching Li et al. experimental conditions:
        //   u* = 0.016 m/s, U0 = 0.233 m/s (depth-averaged), h = 0.05 m
        //   z0 = 4.68e-5 m,  u(z) = (u*/kappa)*ln(z/z0) = 0.0390*ln(z/4.68e-5)
        type            fixedProfile;
        direction       (0 0 1);
        origin          0;
        profile         table
        (
            (0.0000  (0.000  0 0))
            (0.0001  (0.083  0 0))
            (0.0005  (0.146  0 0))
            (0.0010  (0.119  0 0))
            (0.0020  (0.173  0 0))
            (0.0030  (0.197  0 0))
            (0.0050  (0.182  0 0))
            (0.0100  (0.209  0 0))
            (0.0150  (0.225  0 0))
            (0.0200  (0.236  0 0))
            (0.0250  (0.245  0 0))
            (0.0300  (0.252  0 0))
            (0.0400  (0.263  0 0))
            (0.0500  (0.272  0 0))
        );
        value           uniform (0.233 0 0);
    }   
        
    inletSediment
    {
        type            fixedValue;
        value           uniform (0 0 0);
    } 

    outletWater
    {
        type            zeroGradient;
    }

    outletSediment
    {
        type            fixedValue;
        value           uniform (0 0 0);
    }
    
    sideWalls
    {
        type            noSlip;
    }

    bottom
    {
        type            noSlip;
    }

    top
    {
        // Rigid-lid/free-slip approximation at the upper boundary.
        type            slip;
    }

    pier
    {
        type            noSlip;
    }
}

// ************************************************************************* //
