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
    object      nut.b;
}
// ************************************************************************* //

dimensions      [0 2 -1 0 0 0 0];

internalField   uniform 0;

boundaryField
{
    inletWater
    {
        type            calculated;
        value           uniform 0;
    }

    inletSediment
    {
        type            calculated;
        value           uniform 0;
    }

    outletWater
    {
        type            calculated;
        value           uniform 0;
    }

    outletSediment
    {
        type            calculated;
        value           uniform 0;
    }

    sideWalls
    {
        type            nutkWallFunction;
        value           uniform 0;
    }

    bottom
    {
        type            nutkWallFunction;
        value           uniform 0;
    }

    top
    {
        type            calculated;
        value           uniform 0;
    }

    pier
    {
        type            nutkWallFunction;
        Ks              uniform 0.00012;
        Cs              uniform 0.5;
        value           uniform 0;
    }
}

// ************************************************************************* //
