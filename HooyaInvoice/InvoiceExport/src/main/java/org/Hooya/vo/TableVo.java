package org.Hooya.vo;

import com.spire.doc.documents.HorizontalAlignment;
import lombok.Data;
import org.Hooya.common.TableType;

import java.io.Serializable;

@Data
public class TableVo implements Serializable {

    private String template;
    private String dianpu;

    public TableVo(String template, String dianpu) {
        this.template = template;
        this.dianpu = dianpu;
    }

    private String[] tableColumnKeys;
    private float[] tableWidths;
    private String[] tableLabels;
    private TableType tableLabelType;
    private TableType tableContentType;
    private HorizontalAlignment LabelHorizontalAlignment;
    private HorizontalAlignment ContentHorizontalAlignment;
    private int[] unitAddIndex;
}
