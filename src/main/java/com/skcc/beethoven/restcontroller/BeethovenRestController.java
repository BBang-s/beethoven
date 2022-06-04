package com.skcc.beethoven.restcontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;


@RestController
@RequestMapping("/v1/api/btv/")
@Api(tags = "베토벤")
public class BeethovenRestController {

	private static final Logger logger = LoggerFactory.getLogger(BeethovenRestController.class);

   
}
