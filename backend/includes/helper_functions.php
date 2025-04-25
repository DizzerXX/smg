<?php
function validate_email($email) {
    return filter_var($email, FILTER_VALIDATE_EMAIL);
}

function sanitize_input($data, $conn) {
    return $conn->real_escape_string(trim($data));
}

function validate_required_fields($fields) {
    foreach ($fields as $field) {
        if (empty($field)) {
            return false;
        }
    }
    return true;
}

?>
