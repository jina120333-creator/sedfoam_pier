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
        //type            fixedValue;
        //value           uniform (0.005 0 0); //(0.233 0 0); // Approach velocity from Li et al.

        type            uniformFixedValue;
        uniformValue    table
        (
            (0.0     (0      0 0))
            (0.5     (0.025 0 0))
            (1.0     (0.05  0 0))
            (100     (0.05  0 0))
        );
    }   
        
    inletSediment
    {
        type            fixedValue;
        value           uniform (0 0 0); //(0.233 0 0); // Approach velocity from Li et al.
    } 

    outletWater
    {
        type            zeroGradient;
        //type            fixedValue;
        //value           uniform (0 0 0);
    }

    outletSediment
    {
        type            fixedValue;
        value           uniform (0 0 0);
    }
    
    sideWalls
    {
        type            noSlip;
        //type            fixedValue;
        //value           uniform (0 0 0);
    }

    bottom
    {
        type            noSlip;
        //type            fixedValue;
        //value           uniform (0 0 0);
    }

    top
    {
        // Rigid-lid/free-slip approximation at the upper boundary.
        type            slip;
    }

    pier
    {
        type            noSlip;
        //type            fixedValue;
        //value           uniform (0 0 0);
    }
}

// ************************************************************************* //
