import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.example.flavor_template_app.dev"
            resValue(type = "string", name = "app_name", value = "Flavor Template App Dev")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.example.flavor_template_app"
            resValue(type = "string", name = "app_name", value = "Flavor Template App")
        }
    }
}