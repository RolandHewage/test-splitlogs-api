import ballerina/http;
import ballerina/io;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    resource function post payload(http:Caller caller, http:Request req) returns error? {
        // Read the payload as a string
        string payload = check req.getTextPayload();

        // Print the payload to the console
        io:println("Received Payload: ", payload);

        // Respond back to the client
        check caller->respond("Payload received successfully.");
    }
}
