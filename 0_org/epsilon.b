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
    object      epsilon.b;
}
// ************************************************************************* //

dimensions      [0 2 -3 0 0 0 0];

internalField   uniform 1e-6; //1.36e-4; //assume, 혼합길이l=0.07h

boundaryField
{
    inletWater
    {
        type            fixedValue;
        value           uniform 1e-6; //1.36e-4;
    }

    inletSediment
    {
        type            fixedValue;
        value           uniform 1e-6; //1.36e-4;
    }

    outletWater
    {
        type            inletOutlet;
        inletValue      uniform 1e-6;
        value           uniform 1e-6;
    }

    outletSediment
    {
        type            fixedValue;
        value           uniform 1e-6;
    }

    sideWalls
    {
        type            epsilonWallFunction;
        value           uniform 1e-6; //1.36e-4;
    }

    bottom
    {
        type            epsilonWallFunction;
        value           uniform 1e-6; //1.36e-4;
    }

    top
    {
        type            zeroGradient;
    }

    pier
    {
        type            epsilonWallFunction;
        value           uniform 1e-6; //1.36e-4;
    }
}

// ************************************************************************* //
