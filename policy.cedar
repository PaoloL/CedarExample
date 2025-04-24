// Allow everyone to getBike and Allow only vendors to updateBike

//policy0
permit (
    principal,
    action == Recube::MyApp::Action::"getBike",
    resource
);

//policy1
permit (
    principal,
    action == Recube::MyApp::Action::"updateBike",
    resource
)
    when {
    principal.vendor == true
};