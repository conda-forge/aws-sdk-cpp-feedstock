#include <aws/core/Aws.h>
#include <aws/core/auth/AWSCredentials.h>
#include <aws/s3/S3Client.h>
#include <aws/s3/S3ClientConfiguration.h>
#include <iostream>
int main() {
    Aws::SDKOptions options;
    Aws::InitAPI(options);
    bool passed = false;
    {
        Aws::S3::S3ClientConfiguration config;
        config.region = "us-east-1";
        config.scheme = Aws::Http::Scheme::HTTP;
        config.endpointOverride = "127.0.0.1:9";
        config.useVirtualAddressing = false;
        Aws::Auth::AWSCredentials credentials("test-access", "test-secret");
        Aws::S3::S3Client client(credentials, nullptr, config);
        const auto url = client.GeneratePresignedUrl(
            "example-bucket", "folder/native arm64.txt", Aws::Http::HttpMethod::HTTP_GET, 60);
        passed = url.find("http://127.0.0.1:9/example-bucket/folder/native%20arm64.txt?") == 0 &&
                 url.find("X-Amz-Signature=") != Aws::String::npos &&
                 url.find("X-Amz-Credential=test-access%2F") != Aws::String::npos;
    }
    Aws::ShutdownAPI(options);
    if (!passed) return 1;
    std::cout << "Installed SDK initialization and offline S3 signing passed\n";
}
