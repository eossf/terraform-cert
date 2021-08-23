# create an issue with resources dependency

## add a dependency to null_resource command to avoid container exit
 - implicit (set a container name with the volume id for example)
 - explicit 

## check the graph, and see the dependency with null_resource / docker_resource
terraform graph | dot -Tpdf > lesson13-dependencies.pdf
