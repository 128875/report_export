package org.Hooya.common;

public enum TableType {

    shrinkFont("Times New Roman",7.5f, false),
    template01("Times New Roman",9.5f, true),
    template02("Times New Roman",12f, false);

    private final String fontName;
    private final float fontSize;
    private final boolean bold;

    public String getFontName() {
        return fontName;
    }

    public float getFontSize() {
        return fontSize;
    }

    public boolean isBold() {
        return bold;
    }

    TableType(String fontName, float fontSize, boolean bold) {
        this.fontName=fontName;
        this.fontSize=fontSize;
        this.bold = bold;
    }

}
