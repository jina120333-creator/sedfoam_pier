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
    class       volScalarField;
    location    "0";
    object      k.b;
}
// ************************************************************************* //

dimensions      [0 2 -2 0 0 0 0];

internalField   uniform 1e-12; //2.04e-4; //assume, turbulence intensity 5%, k=3/2(UI)^2, u=0.233m/s
//internalField   uniform 0; 

boundaryField
{
    inletWater
    {
        type            fixedValue;
        value           uniform 1e-10;  //2.04e-4; //1e-10;
    }

    inletSediment
    {
        type            fixedValue;
        value           uniform 1e-10;  //2.04e-4; //1e-10;
    }

    outletWater
    {
        type            zeroGradient;
        /*
        type            inletOutlet;
        inletValue      uniform 1e-10;
        value           uniform 1e-10;
        */
    }

    outletSediment
    {
        type            zeroGradient;
        /*
        type            fixedValue;
        value           uniform 1e-10;
        */
    }

    sideWalls
    {
        type            kqRWallFunction;
        value           uniform 1e-10; //2.04e-4; //1e-10;
    }

    bottom
    {
        //type            zeroGradient;
        type            kqRWallFunction;
        value           uniform 1e-10; //2.04e-4; //1e-10;
    }

    top
    {
        type            zeroGradient;
    }

    pier
    {
        type            kqRWallFunction;
        value           uniform 1e-10; //2.04e-4; //1e-10;
    }
}

// ************************************************************************* //
