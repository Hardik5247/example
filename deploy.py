from servicefoundry import __version__, Build, Resources, Service, DockerFileBuild, LocalSource

print(__version__)

build_args = {
    "FOO": "Hello",
    "BAR": "World!"
}

service = Service(
    name="my-service-1",
    image=Build(
        build_spec=DockerFileBuild(
            build_args=build_args,
            build_context_path="./",
            command="",
        ),
        build_source=LocalSource(
            local_build=False
        )
    ),
    ports=[{"expose": False, "port": 4000}],
    replicas=1,
    resources=Resources(cpu_limit=0.6),
)

deployment = service.deploy(workspace_fqn="tfy-gcp-develop-asso1:default")
