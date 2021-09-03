<?php

return new PDO("mysql:host=db_node;dbname=sample", "sampleuser", "samplepass", [PDO::ATTR_PERSISTENT => true]);
