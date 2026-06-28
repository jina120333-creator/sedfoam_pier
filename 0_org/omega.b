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
    object      omega.b; 
}
// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //

dimensions      [0 0 -1 0 0 0 0];

internalField   uniform 1882; 

boundaryField
{
    inletWater
    {
        type            fixedValue;
        value           uniform 0;
    }
    inletSediment
    {
        type            fixedValue;
        value           uniform 0;
    }
    outletWater
    {
        type            zeroGradient;
    }
    outletSediment
    {
        type            zeroGradient;
    }
    pier
    {
        type            omegaWallFunction; 
        value           uniform 0.033;
    }
    bottom
    {
        type            omegaWallFunction; 
        value           uniform 0.033;
    }
    top
    {
        type            zeroGradient;
    }
    sideWalls
    {
        type            zeroGradient;
    }
}
// ************************************************************************* //
