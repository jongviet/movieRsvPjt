package com.rsv.domain;

public class MoviRankVO {

    private int moviCount;
    private String moviName;

    public MoviRankVO(int moviCount, String moviName) {
        this.moviCount = moviCount;
        this.moviName = moviName;
    }

    public int getMoviCount() {
        return moviCount;
    }

    public void setMoviCount(int moviCount) {
        this.moviCount = moviCount;
    }

    public String getMoviName() {
        return moviName;
    }

    public void setMoviName(String moviName) {
        this.moviName = moviName;
    }

    @Override
    public String toString() {
        return "moviRankVO [moviCount=" + moviCount + ", moviName=" + moviName + "]";
    }

}