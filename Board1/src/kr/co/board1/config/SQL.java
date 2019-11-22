package kr.co.board1.config;

public class SQL {
	// 회원 관련
	public static final String SELECT_LOGIN = "SELECT * FROM `BOARD_MEMBER` WHERE `uid`=? AND `pass`=PASSWORD(?);";
	public static final String INSERT_USER  = "INSERT INTO `BOARD_MEMBER` SET "
								  			+ "`uid`='?',"
								  			+ "`pass`=PASSWORD('?'),"
								  			+ "`name`='?',"
								  			+ "`nick`='?',"
								  			+ "`email`='?',"
								  			+ "`hp`='?',"
								  			+ "`zip`='?',"
								  			+ "`addr1`='?',"
								  			+ "`addr2`='?',"
								  			+ "`regip`='?',"
								  			+ "`rdate`=NOW();";
	public static final String SELECT_TERMS = "SELECT * FROM `BOARD_TERMS` ;";
	public static final String SELECT_CHECK_UID 	= "SELECT COUNT(*) FROM `BOARD_MEMBER` WHERE `uid`=?";
	public static final String SELECT_CHECK_NICK 	= "SELECT COUNT(*) FROM `BOARD_MEMBER` WHERE `nick`=?";
	public static final String SELECT_CHECK_EMAIL 	= "SELECT COUNT(*) FROM `BOARD_MEMBER` WHERE `email`=?";
	public static final String SELECT_CHECK_HP 		= "SELECT COUNT(*) FROM `BOARD_MEMBER` WHERE `hp`=?";
	
	// 게시물 관련
	public static final String SELECT_ARTICLE_LIST = "SELECT a.*, b.nick FROM `BOARD_ARTICLE` AS a "
												   + "JOIN `BOARD_MEMBER` AS b "
												   + "ON a.uid = b.uid "
												   + "WHERE a.parent = 0 "
												   + "ORDER BY seq DESC;";
	
	public static final String SELECT_ARTICLE_VIEW = "SELECT * FROM `BOARD_ARTICLE` WHERE `seq`=?";
	public static final String UPDATE_ARTICLE_HIT = "UPDATE `BOARD_ARTICLE` SET `hit`=`hit`+1 WHERE `seq`=?";

	
	public static final String INSERT_ARTICLE  = "INSERT INTO `BOARD_ARTICLE` SET "
											   + "`parent`=?,"	
											   + "`cate`=?,"	
											   + "`title`=?,"	
											   + "`content`=?,"	
											   + "`file`=?,"	
											   + "`uid`=?,"	
											   + "`regip`=?,"	
											   + "`rdate`=NOW();";	
	public static final String UPDATE_MODIFY_ARTICLE = "UPDATE `BOARD_ARTICLE` SET `title`=?, `content`=? WHERE `seq`=?";
	public static final String DELETE_ARTICLE = "DELETE FROM `BOARD_ARTICLE` WHERE `seq`=?"; //OR `parent`=?;
	
	public static final String UPDATE_COMMENT_COUNT2 = "UPDATE `BOARD_ARTICLE` SET `comment` = `comment` - 1 WHERE `seq`=?";
	public static final String UPDATE_COMMENT_COUNT = "UPDATE `BOARD_ARTICLE` SET `comment` = `comment` + 1 WHERE `seq`=?";
	public static final String SELECT_COMMENT_LIST = "SELECT * FROM `BOARD_ARTICLE` WHERE parent=?";
	public static final String INSERT_COMMENT = "INSERT INTO `BOARD_ARTICLE` SET "
			                                  + "`parent`=?, "
			                                  + "`content`=?, "
			                                  + "`uid`=?, "
			                                  + "`regip`=?, "
			                                  + "`rdate`=NOW()";
}
