package com.callor.student.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class ScoreVO {
	private String sc_stnum;	// varchar(5)
	private String sc_sbcode;	// varchar(5)
	private String sb_name;	// varchar(20)
	private int sc_score;	// int
}
