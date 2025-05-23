#!/bin/bash

echo "Running Julia Setup..."

# Print out the Julia commands for lookup
echo "The following commands are being executed for Julia setup:"
echo "julia --project=docs/ -e 'using Pkg; Pkg.develop(PackageSpec(path=pwd())); Pkg.instantiate()'"
echo "julia --project=docs/ docs/make.jl"

# Execute the Julia setup commands
echo "Running Julia package setup..."
julia --project=docs/ -e 'using Pkg; Pkg.develop(PackageSpec(path=pwd())); Pkg.instantiate()' 
if [ $? -ne 0 ]; then
    echo "Documentation build failed during instantiation step."
    exit 1
fi
echo "Julia package setup completed successfully."

# Build the documentation
echo "Running Julia documentation build..."
julia --project=docs/ docs/make.jl
if [ $? -ne 0 ]; then
    echo "Documentation build failed during documentation build step."
    exit 1
fi
echo "Documentation build succeeded!"
